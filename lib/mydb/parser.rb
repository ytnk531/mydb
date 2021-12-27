require_relative 'command'

module Mydb
  class Parser2
    def parse(sentence)
      tokens = sentence.split(' ')
      if tokens[0] == 'CREATE'
        args = sentence.scan(/CREATE TABLE (.+) \((.+)\);/)[0]
        CreateCommand.new(args[0], args[1])
      elsif tokens[0] == 'INSERT'
        args = sentence.scan(/INSERT (.+) \((.+)\) VALUE \((.+)\);/)[0]
        InsertCommand.new(args[0], args[1], args[2])
      elsif tokens[0] == 'SELECT'
        args = sentence.scan(/SELECT (.+) FROM (.+);/)[0]
        SelectCommand.new(args[1], args[0])
      end
    end
  end
end
