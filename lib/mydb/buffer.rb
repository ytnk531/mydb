class Buffer < Struct.new(:page_id, :page, :is_dirty)
end

class Frame < Struct.new(:buffer, :usage_count)
  def rend
    usage_count += 1

    buffer
  end
end

class BufferPool < Struct.new(:buffers, :next_victim_id)
  def evict
    pool_size = buffers.size
    consecutive_pinned = 0

    loop do
      frame = buffers[next_victim_id]
      return next_victim_id if frame.usage_count == 0

      consecutive_pinned += 1
      return nil if consecutive_pinned >= pool_size

      self.next_victim_id = next_buffer_id(next_victim_id)
    end
  end

  def next_buffer_id(buffer_id)
    (buffer_id + 1) % buffers.size
  end

  def rend(buffer_id)
    buffers[buffer_id].rend
  end

  def recycle_buffer(buffer_id, disk, page_table)
    buffer = buffers[buffer_id].buffer
    sync(buffer, disk)
    frame.usage_count = 1
    page_table.delete(buffer.page_id)
  end

  def sync(buffer, disk)
    disk.write_page_data(buffer.page_id, buffer.page) if buffer.is_dirty
  end
end

class BufferPoolManager < Struct.new(:disk, :pool, :page_table)
  def fetch_page(page_id)
    cached_buffer_id = buffer_id_of(page_id)
    if cached_buffer_id
      pool.rend(cached_buffer_id)
    else
      evict_buffer_id = pool.evict
      pool.recycle_buffer(evict_buffer_id, disk, page_table)
      page_table.merge!(page_id => evict_buffer_id)
    end
  end

  private

  def buffer_id_of(page_id)
    page_table[page_id]
  end
end
