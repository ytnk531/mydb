class MyParser
rule
  \s+
  \d+ { [:NUMBER, text.to_i] }
  \+ { ['+', text] }
end
