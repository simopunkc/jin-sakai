class M_item
    attr_accessor :name, :price, :id, :category
    def initialize(name=nil,price=nil,id=nil,category=nil)
        @name = name
        @price = price
        @id =id
        @category = category
    end
end