class CartItem < ApplicationRecord
  belongs_to :items
  belongs_to :customer
  
  def subtotal
    item.add_tax_price * amount
  end
end
