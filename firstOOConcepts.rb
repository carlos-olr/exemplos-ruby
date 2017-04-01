class Product
    @@id = 0
    attr_accessor :id
    attr_accessor :name
    attr_accessor :price

    def initialize(name, price)
        @id, @name, @price = @@id+=1, name, price
    end

    def to_s
        "{id: #{@id}, name: '#{@name}', price: #{@price}}"
    end
end

class OrderItem
    @@id = 0
    @product
    @quantity
    @totalPrice
    attr_accessor :product
    attr_accessor :quantity
    attr_accessor :totalPrice

    def initialize(product, quantity)
        @id, @product, @quantity = @@id+=1, product, quantity
        @totalPrice = @quantity * @product.price
    end

    def to_s
        "{id: #{@id}, product: #{@product}, quantity: #{@quantity}, totalPrice: #{@totalPrice}}"
    end
end

class Order
    @@id = 0
    @items
    @creationDate
    attr_accessor :items
    attr_accessor :creationDate

    def initialize
        @id, @creationDate = @@id+=1, Time.now
        @items = Array.new
    end

    def addItem(product, quantity)
        item = OrderItem.new(product, quantity)
        @items.push(item)
    end

    def to_sItens
        result = '['
        @items.each_with_index do |item, idx|
            result+=item.to_s
            if idx+1 <= @items.length
                result+=', '
            end
        end
        result + ']'
    end

    def formatCreationDate
        @creationDate.strftime('%Y-%m-%d')
    end

    def getTotal
        result = 0.0
        @items.each do |item|
            result += item.totalPrice
        end
        result.round(2)
    end

    def to_s
        "{id: #{@id}, total: #{getTotal}, creationDate: #{formatCreationDate}, itens: #{to_sItens}}"
    end

    private :to_sItens, :formatCreationDate
end

order1 = Order.new()
order1.addItem(Product.new('P1', 10.99), 2)
order1.addItem(Product.new('P2', 8.50), 3)

puts order1