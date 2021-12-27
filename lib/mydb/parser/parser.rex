class Mydb::Parser::Parser
option
  ignorecase
rule
  \s+
  ; { [:SEMICOLON, text] }
  CREATE { [:CREATE, text] }
  TABLE { [:TABLE, text] }
  INSERT { [:INSERT, text] }
  SELECT { [:SELECT, text] }
  FROM { [:FROM, text] }
  VALUE { [:VALUE, text] }
  VALUES { [:VALUES, text] }
  \( { [:LEFT_PAREN, text] }
  \) { [:RIGHT_PAREN, text] }
  \* { [:STAR, text] }
  , { [:COMMA, text] }
  ' { [:SINGLE_QUATE, text] }
  \w+ { [:IDENT, text] }
end
