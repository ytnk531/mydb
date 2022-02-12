# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe Mydb do
  let(:factory) { Mydb::CommandFactory.new }

  it 'builds insert command' do
    parser = Mydb::Parser::Parser.new
    command = parser.scan_str("INSERT tble_name (name, birth) VALUE ('v1', 'v2');")

    expect(command).to be_a Mydb::InsertCommand
  end
end
