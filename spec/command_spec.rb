require_relative 'spec_helper'

RSpec.describe 'Mydb::CreateCommand' do
  it 'creates specified table' do
    command = Mydb::CreateCommand.new("test_table", ["customer"])
    command.run
    expect(Mydb::Store.get.show_all["customer"]).to be_instance_of Mydb::Table
  end

  it 'use table name' do
    command = Mydb::CreateCommand.new("test_table", ["user"])
    command.run
    expect(Mydb::Store.get.show_all["user"]).to be Mydb::Table
  end
end