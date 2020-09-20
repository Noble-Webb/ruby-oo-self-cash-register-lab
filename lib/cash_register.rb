class CashRegister
    attr_accessor :total, :quantity, :discount, :items, :last_list, :void_last_transaction
    attr_reader   :price, :title
    @@last_list = []

    def initialize(discount=0) #initializes optional discount 
        @total = 0
        @discount = discount 
        @@items = [] #class 
    end

    def total
        @total #returns the current total 
    end

    def add_item(title, price, quantity=1) #takes in a title, price, and optional quantity arguments and augments the total by only price when quantity is less than zero else total changes by price*quantity when 
       @@last_list << [title, price, quantity] #stores arguments for void last
        self.total += price * quantity #the current instances total will be positively changed by price*quantity

        quantity.times do 
            @@items << title
        end
    end

    def apply_discount #applies a 20% discount
        if discount != 0 #if the discount is not zero then 
            self.total *= ((100.0 - self.discount.to_f)/100) #takes in the total instance and applies an 80% discount 
            "After the discount, the total comes to $#{self.total.to_i}." #returns the string with an interpolated instance total converted to an int
        else
            "There is no discount to apply."
        end 
    end

    def items
        @@items 
    end

    def void_last_transaction 
        if @@items.count == 0
            self.total = 0.0
        else 
            self.total -= @@last_list.last[1] * @@last_list.last[-1]
        end
        
    end
end


sam = CashRegister.new
sam.add_item("eggs", 4.99, 2)
sam.add_item("vodka", 21, 1)
p sam.void_last_transaction
  
