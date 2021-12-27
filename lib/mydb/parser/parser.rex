class Mydb::Parser::Parser
option
  ignorecase
rule
  \s+
  ; { [:SEMICOLON, text] }
  CREATE { [:CREATE, text] }
  TABLE { [:TABLE, text] }
  \( { [:LEFT_PAREN, text] }
  \) { [:RIGHT_PAREN, text] }
  , { [:COMMA, text] }
  \w+ { [:IDENT, text] }
end
