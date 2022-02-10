class Buffer < Struct.new(:page_id, :page, :is_dirty)
end

class Frame < Struct.new(:buffer, :usage_count)
  def rend
    self.usage_count += 1

    buffer
  end
end

