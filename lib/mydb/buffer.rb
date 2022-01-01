class Buffer < Struct.new(:page_id, :page, :is_dirty)
end

class Frame < Struct.new(:buffer, :usage_count)
  def rend
    self.usage_count += 1

    buffer
  end
end

class BufferPool < Struct.new(:buffers, :next_victim_id)
  def evict
    consecutive_pinned = 0

    loop do
      frame = buffers[next_victim_id]
      return next_victim_id if frame.usage_count == 0

      consecutive_pinned += 1
      return nil if consecutive_pinned >= pool_size

      self.next_victim_id = next_buffer_id(next_victim_id)
    end
  end

  def pool_size
    buffers.size
  end

  def recycle_buffer(buffer_id, disk, page_table)
    frame = buffers[buffer_id]
    buffer = frame.buffer
    sync(buffer, disk)
    frame.usage_count = 1
    page_table.delete(buffer.page_id)
    buffer
  end

  def next_buffer_id(buffer_id)
    (buffer_id + 1) % buffers.size
  end

  def rend(buffer_id)
    buffers[buffer_id].rend
  end

  def sync(buffer, disk)
    disk.write_page_data(buffer.page_id, buffer.page) if buffer.is_dirty
  end

  def add_buffer(page_id, disk)
    b = Buffer.new(page_id, disk.read_page_data(page_id), false)
    f = Frame.new(b, 0)
    buffers.append(f)
    f
  end
end

class BufferPoolManager < Struct.new(:disk, :pool, :page_table)
  def fetch_page(page_id)
    cached_buffer_id = buffer_id_of(page_id)
    if cached_buffer_id
      pool.rend(cached_buffer_id)
    else
      if evict_buffer_id = pool.evict
        buffer = pool.recycle_buffer(evict_buffer_id, disk, page_table)
        add_buffer(page_id, evict_buffer_id)
      else
        buffer = pool.add_buffer(page_id, disk)
        add_buffer(page_id, pool.buffers.size - 1)
      end
      
      buffer
    end
  end

  private

  def buffer_id_of(page_id)
    page_table[page_id]
  end

  def add_buffer(page_id, buffer_id)
    page_table.merge!(page_id => buffer_id)
  end
end
