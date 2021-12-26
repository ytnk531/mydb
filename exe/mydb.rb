require 'mydb'
require 'readline'
require 'sql-parser'

Signal.trap(:SIGINT) do
  Mydb::Store.get.persist
  exit
end

parser = SQLParser::Parser.new
command_factory = CommandFactory.new

while buf = Readline.readline("> ", true) do
  begin
    ast = parser.scan_str(buf)
    command = command_factory.build(ast)

    unless command
      raise "Syntax error"
    end
    command.run
    Mydb::Store.get.persist
  rescue => e
    STDERR.puts e.full_message
  end
end

