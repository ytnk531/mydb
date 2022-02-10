
class BufferPoolManager < Struct.new(:disk, :pool, :page_table)
  def fetch_page(page_id)
    cached_buffer_id = buffer_id_of(page_id)
    if cached_buffer_id
      pool.rend(cached_buffer_id)
    else
      if evict_buffer_id = pool.evict
        buffer = pool.recycle_buffer(evict_buffer_id, disk, page_table, page_id)
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
