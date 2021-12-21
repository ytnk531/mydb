require 'mydb'

loop do
  input = gets

  begin
    command = Mydb::Parser.new.parse(input)
    command.run
  # rescue => e
  #   puts e.inspect
  #   puts e.cause
  end
end

