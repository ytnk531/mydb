# mysql> CREATE TABLE customer (id INTEGER, name VARCHAR(20));
# ERROR 1046 (3D000): No database selected
# mysql> user test
#     -> ;
# ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'user test' at line 1
# mysql> use test;
# Database changed
# mysql> CREATE TABLE customer (id INTEGER, name VARCHAR(20));
# Query OK, 0 rows affected (0.02 sec)
# 
# mysql> INSERT customer (id 1, name 'aaa');
# ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '1, name 'aaa')' at line 1
# mysql> INSERT customer (id, name) VALUE (10, 'aaa');
# Query OK, 1 row affected (0.01 sec)
# 
# mysql> SELECT * FROM customer
#     -> ;
# +------+------+
# | id   | name |
# +------+------+
# |   10 | aaa  |
# +------+------+
# 1 row in set (0.00 sec)
# 
# mysql>
#

class Store
  def self.get
    @@instance ||= Store.new
  end

  def initialize
    @tables = {}
  end

  def add(table)
    @tables.merge!(table.tbl_name => table)
  end

  def show_all
    @tables
  end

  def table(table_name)
    @tables[table_name]
  end
end

class Table
  attr_reader :tbl_name

  def initialize(tbl_name, columns)
    @tbl_name = tbl_name
    @columns = columns
    @rows = []
  end

  def insert(row)
    @rows << row
  end

  def column_names
    @columns
  end

  def rows_as_object
    @rows.map { Row.new(_1) }
  end
end

class Row
  def initialize(attributes)
    @data = attributes
  end

  def show(attributes)
    attributes.map do |attr|
      @data[attr]
    end.join(" ")
  end
end

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

def parse(sentence)
  tokens = sentence.split(' ')
  if tokens[0] == 'CREATE'
    args = sentence.scan(/CREATE TABLE (.+) \((.+)\);/)[0]
    CreateCommand.new(args[0], args[1])
  elsif tokens[0] == 'INSERT'
    args = sentence.scan(/INSERT (.+) \((.+)\) VALUE \((.+)\);/)[0]
    InsertCommand.new(args[0], args[1], args[2])
  elsif tokens[0] == 'SELECT'
    args = sentence.scan(/SELECT (.+) FROM (.+);/)[0]
    SelectCommand.new(args[1], args[0])
  end
end

loop do
  input = gets

  begin
    command = parse(input)
    command.run
  # rescue => e
  #   puts e.inspect
  #   puts e.cause
  end
end

