require_relative 'store'
require_relative 'table'

module Mydb
  # mysql> CREATE TABLE customer (id INTEGER, name VARCHAR(20));
  # Query OK, 0 rows affected (0.02 sec)
  class CreateCommand
    def initialize(tbl_name, create_definitions)
      @tbl_name = tbl_name
      @create_definitions = create_definitions
    end
  
    def run
      columns = @create_definitions
      table = Table.new(@tbl_name, columns)
      store = Store.get
      store.add(table)
    end
  end
  
  # mysql> INSERT customer (id, name) VALUE (10, 'aaa');
  # Query OK, 1 row affected (0.01 sec)
  class InsertCommand
    def initialize(tbl_name, col_names, value_list)
      @tbl_name = tbl_name
      @col_names = col_names
      @value_list = value_list
    end
  
    def run
      store = Store.get
      table = store.table(@tbl_name)
      @value_list.each do |values|
        row = @col_names.zip(values).to_h
        table.insert(row)
      end
    end
  end
  
  class SelectCommand
    def initialize(tbl_name, select_expr, where=NullWhereStatement.new)
      @tbl_name = tbl_name
      @select_expr = select_expr
      @where = where
    end
  # mysql> SELECT * FROM customer
  #     -> ;
  # +------+------+
  # | id   | name |
  # +------+------+
  # |   10 | aaa  |
  # +------+------+
  # 1 row in set (0.00 sec)
    def run
      store = Store.get
      table = store.table(@tbl_name)
      col_names = if @select_expr == '*'
                    table.column_names
                  else
                    @select_expr
                  end
      table
        .rows_as_object
        .select { @where.matches?(_1) }
        .each { puts _1.show(col_names) }
    end
  end

  class WhereStatement
    def initialize(col_name, val)
      @col_name = col_name
      @val = val
    end

    def matches?(row)
      row.show([@col_name]) == @val
    end
  end

  class NullWhereStatement
    def matches?(_row)
      true
    end
  end
end
