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
      definitions = @create_definitions.split(", ")
      columns = definitions.map { _1.split(" ")[0] }
      table = Table.new(@tbl_name, columns)
      store = Store.get
      store.add(table)
      store.show_all
    end
  end
  
  # mysql> INSERT customer (id, name) VALUE (10, 'aaa');
  # Query OK, 1 row affected (0.01 sec)
  class InsertCommand
    def initialize(tbl_name, col_names, value_list)
      @tbl_name = tbl_name
      @col_names = col_names.split(", ")
      @value_list = value_list.split(", ")
    end
  
    def run
      store = Store.get
      table = store.table(@tbl_name)
      row = @col_names.zip(@value_list).to_h
      table.insert(row)
    end
  end
  
  class SelectCommand
    def initialize(tbl_name, select_expr)
      @tbl_name = tbl_name
      @select_expr = select_expr
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
                  end
      table.rows_as_object.each do
        puts _1.show(col_names)
      end
    end
  end
end
