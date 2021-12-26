# frozen_string_literal: true
require_relative 'spec_helper'
require 'sql-parser'

RSpec.describe Mydb do
  let(:factory) { Mydb::CommandFactory.new }

  it "builds insert command" do
    SQLParser::Parser.parse('INSERT INTO `users` VALUES (1, 2);')
    command = factory.build(ast)

    expect(command).to be_truethy
  end
end
