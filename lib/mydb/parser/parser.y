class Mydb::Parser::Parser
rule
  query : statement SEMICOLON

  statement : r_CREATE_TABLE
    | create_statement

  r_CREATE_TABLE : CREATE TABLE r_tbl_name r_create_definition_list { result = Mydb::CreateCommand.new(val[2], val[3]) }

  r_create_definition_list :
  LEFT_PAREN r_comma_separated_create_definition RIGHT_PAREN { result = val[1] }

  r_comma_separated_create_definition :
    r_create_definition { result = [val[0]] }
  | r_comma_separated_create_definition COMMA r_create_definition { result = val[0].append(val[2]) }

  r_create_definition : r_col_name r_column_definition

  r_column_definition :
    r_col_name
  | r_col_name LEFT_PAREN IDENT RIGHT_PAREN
  r_col_name : IDENT
  r_tbl_name : IDENT
end

---- footer
require_relative './parser.rex'

# INSERT customer (id, name) VALUE (10, 'aaa');
# SELECT * FROM customer;
