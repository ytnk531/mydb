require_relative '../spec_helper'
require 'mydb/buffer'
require 'mydb/disk'

RSpec.describe Frame do
  it 'stores buffer and meta data' do
    f = Frame.new(nil, 10)

    expect(f.buffer).to be nil
    expect(f.usage_count).to be 10
  end
end

RSpec.describe BufferPoolManager do
  let!(:disk_manager) { DiskManager.new('test') }

  describe '#fetch_page' do
    it 'reuses buffer' do
      buf = Buffer.new(10, "abs", false)
      frames = [ Frame.new(buf, 0), ]
      pool = BufferPool.new(frames, 0)
      page_table = { 10 => 0 }
      manager = BufferPoolManager.new(disk_manager,pool, page_table)

      expect(manager.fetch_page(10)).to eq buf
    end

    it 'creates new buffer' do
      buf = Buffer.new(10, "abs", false)
      frames = [ Frame.new(buf, 0)]
      pool = BufferPool.new(frames, 0)
      manager = BufferPoolManager.new(disk_manager, pool, 10 => 0)

      expect(manager.fetch_page(11)).to eq Buffer.new(11, nil, false)
    end
  end
end
