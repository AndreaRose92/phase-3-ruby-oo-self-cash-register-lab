class CashRegister

    attr_accessor :total, :discount, :items, :last_item

    def initialize discount = 0, total = 0, items = []
        @discount = discount
        @total = total
        @items = items
    end

    def add_item title, price, quantity = 1
        self.total += price * quantity
        quantity.times do
            self.items << title
        end
        self.last_item = price
    end

    def apply_discount
        if self.discount == 0
            return "There is no discount to apply."
        else
            self.total = (self.total - ((self.total * self.discount)/100))
            self.total
            return "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def void_last_transaction
        item = self.items.pop
        self.total -= self.last_item
        while item == self.items.last do
            self.items.pop
            self.total -= self.last_item
        end
    end

end