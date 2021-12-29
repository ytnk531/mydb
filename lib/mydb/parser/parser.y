class Mydb::Parser::Parser
rule
  query : statement SEMICOLON

  statement :
            create_table
            | insert
            | select
  create_table : CREATE TABLE tbl_name create_definition_list { result = Mydb::CreateCommand.new(val[2], val[3]) }

  create_definition_list :
  LEFT_PAREN comma_separated_create_definition RIGHT_PAREN { result = val[1] }

  comma_separated_create_definition :
    create_definition { result = [val[0]] }
  | comma_separated_create_definition COMMA create_definition { result = val[0].append(val[2]) }

  create_definition : col_name column_definition

  column_definition :
    col_name
  | col_name LEFT_PAREN IDENT RIGHT_PAREN

  select : SELECT select_target FROM tbl_name { result = Mydb::SelectCommand.new(val[3], val[1]) }
         | SELECT select_target FROM tbl_name where_statement { result = Mydb::SelectCommand.new(val[3], val[1], val[4]) }

  where_statement : WHERE col_name EQUAL column_value { result = Mydb::WhereStatement.new(val[1], val[3]) }

  select_target: STAR
               | comma_separated_col_names

  insert : INSERT tbl_name col_name_list values value_list_list { result = Mydb::InsertCommand.new(val[1], val[2], val[4]) }

  value_list_list : value_list_paren { result = val }
                  | value_list_list COMMA value_list_paren { result = val[0].append(val[2]) }

  value_list_paren : LEFT_PAREN value_list RIGHT_PAREN { result = val[1] }

  value_list : column_value { result = val }
             | value_list COMMA column_value { result = val[0].append(val[2]) }

  column_value : IDENT
               | SINGLE_QUATE IDENT SINGLE_QUATE { result = val[1] }

  values : VALUE
         | VALUES

  col_name_list: LEFT_PAREN comma_separated_col_names RIGHT_PAREN { result = val[1] }

  comma_separated_col_names : col_name { result = val }
                | comma_separated_col_names COMMA col_name { result = val[0].append(val[2]) }

  col_name : IDENT
  tbl_name : IDENT
end

---- footer
require_relative './parser.rex'

# INSERT customer (id, name) VALUE (10, 'aaa');
# SELECT * FROM customer;
