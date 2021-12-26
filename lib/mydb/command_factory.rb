module Mydb
  class CommandFactory
    def build(ast)
      case ast
      in SQLParser::Statement::Insert
        InsertCommand.new(
          ast.table_reference,
          ast.column_list,
          ast.in_value_list
        )
      end
    end
  end
end
