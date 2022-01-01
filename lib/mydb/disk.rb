class DiskManager
  PAGE_SIZE = 4096

  def initialize(filename)
    @heap_file = File.open(filename, "rb+")
  end

  def write_page_data(page_id, data)
    seek_for(page_id)
    @heap_file.write(data)
  end

  def read_page_data(page_id)
    seek_for(page_id)
    @heap_file.read(PAGE_SIZE)
  end

  attr_reader :heap_file

  private

  def seek_for(page_id)
    offset = page_id * PAGE_SIZE
    @heap_file.seek(offset, IO::SEEK_SET)
  end
end

