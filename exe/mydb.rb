require 'mydb'
require 'readline'

Signal.trap(:SIGINT) do
  Mydb::Store.get.persist
  exit
end

while buf = Readline.readline("> ", true) do
  begin
    command = Mydb::Parser.new.parse(buf)
    unless command
      raise "Syntax error"
    end
    command.run
    Mydb::Store.get.persist
  rescue => e
    STDERR.puts e.full_message
  end
end

