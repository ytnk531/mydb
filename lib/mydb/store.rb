module Mydb
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
end
