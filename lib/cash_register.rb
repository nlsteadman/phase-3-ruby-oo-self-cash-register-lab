class CashRegister
    attr_accessor :total, :discount, :previous_total, :items

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        self.previous_total = price * quantity
        self.total += self.previous_total
        quantity.times do
            self.items << title
        end
    end

    def apply_discount
        if self.discount != 0
            discount_math = (100.0 - self.discount.to_f) / 100
            self.total = (self.total * discount_math).to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.previous_total
    end
end
