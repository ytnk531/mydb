require 'btree'

module Mydb
  class MyBTree
  
    def self.create(bufmngr)
      @bufmngr = bufmngr
      @tree = Btree.create
    end
  
    def insert(key, value)
      @tree[key] = value
    end
  end
end
