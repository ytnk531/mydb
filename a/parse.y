class MyParser
rule
  stmt: NUMBER '+' NUMBER
        { puts val[0] + val[2] }
end

---- header
require_relative 'parse.rex'

---- inner

---- footer

MyParser.new.scan_str(gets)
