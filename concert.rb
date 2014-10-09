class Customer
	def initialize(in_name)
    @name = in_name
    @tickets = []
	end
	
  def buy(in_ticket)
    @tickets.push(in_ticket)
    in_ticket.buyers.push(self)
  end
	
  attr_accessor :name, :tickets
end




class Ticket
  def initialize(in_item, in_price)
    @item = in_item
    @price = in_price
    @buyers = []
  end
  
  def sell(in_buyer)
    @buyers << in_buyer
    in_buyer.tickets << self
  end

  def total_sales
    buyers.length * @price
  end
  
  attr_accessor :buyers
end

# yamada = Customer.new("Taro Yamada")
# kawada = Customer.new("Jiro Kawada")
# oakada = Customer.new("Saburo Okada")

# mozart = Ticket.new("Piano Concerto No.24", 5000)
# wagner = Ticket.new("Tristan und Isolde", 10000)

# yamada.buy(mozart)
# kawada.buy(wagner)
# oakada.buy(wagner)
# wagner.sell(yamada)
# mozart.sell(oakada)

# for customer in wagner.buyers
#   puts customer.name
# end

# puts wagner.total_sales