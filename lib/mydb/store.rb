module Mydb
  class Store
    def self.get
      @@instance ||= restore
    end

    def self.restore
      begin
        tables = if File.exist?("data")
          Marshal.load(File.open("data", "rb"))
                 else
                   {}
                 end
      rescue EOFError
        STDERR.puts "err"
        tables = {}
      end
      Store.new(tables)
    end
  
    def initialize(tables = {})
      @tables = tables
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

    def persist
      File.open("data", "wb") do
        Marshal.dump(@tables, _1)
      end
    end
  end
end
