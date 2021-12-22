require 'mydb'

Signal.trap(:SIGINT) { Mydb::Store.get.persist }

loop do
  input = gets

  begin
    command = Mydb::Parser.new.parse(input)
    command.run
    Mydb::Store.get.persist
#  rescue => e
#    puts e.inspect
#    puts e.cause
  end
end

