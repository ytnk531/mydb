require 'securerandom'

values = (1..100000).map do
  id = rand 100000000
  name = SecureRandom.alphanumeric(10)
  "(#{id}, '#{name}')"
end.join(",")

puts "INSERT customer (id, name) VALUES #{values};"
