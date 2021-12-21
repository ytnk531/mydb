module Mydb
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
end
