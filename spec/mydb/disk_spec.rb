require_relative '../spec_helper'
require 'mydb/disk'

RSpec.describe DiskManager do
  let!(:manager) { DiskManager.new('test') }
  describe '#write_page_data' do
    it 'writes data with paddings' do
      manager.write_page_data(2, 'abs')
      expect(IO.read('test', 3, 8192, mode: "rb")).to eq 'abs'
    end
  end

  describe '#read_page_data' do
    it 'writes data with paddings' do
      manager.write_page_data(2, 'abs')
      data = manager.read_page_data(2)
      expect(data).to eq 'abs'
    end
  end
end
