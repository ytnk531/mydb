# frozen_string_literal: true
require_relative 'spec_helper'
require 'sql-parser'

RSpec.describe Mydb do
  let(:factory) { Mydb::CommandFactory.new }

  it "builds insert command" do
    ast = Parser.parse("insert into table VALUE ('v1', 'v2')")
    command = factory.build(ast)

    expect(command).to be_truethy
  end
end
