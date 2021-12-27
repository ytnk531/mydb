require 'mydb'
require 'readline'

Signal.trap(:SIGINT) do
  Mydb::Store.get.persist
  exit
end

parser = Mydb::Parser::Parser.new
# command_factory = MydbCommandFactory.new

while buf = Readline.readline("> ", true) do
  begin
    command = parser.scan_str(buf)
    pp command
    raise "Syntax error" unless command
    command.run
    Mydb::Store.get.persist
  rescue => e
    STDERR.puts e.full_message
  end
end

