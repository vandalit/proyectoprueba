class ShoppingCart < ApplicationRecord
  belongs_to :user
  has_many :shopping_cart_products
  has_many :products, through: :shopping_cart_products 

  def update_total
    self.update(total: self.get_total)
  end

  # def get_total
  #   total=0

  #   self.products.each do |prod|
  #     total+= prod.precio
  #   end

  #   total
  # end

  def get_total(id)
    ShoppingCart.joins(:shopping_cart_prouducts)
    .joins(:products)
    .where(shoppping_carts: {id: id} )
    .group(:shopping_cart_products)
    #.group('shopping_cart_products.product_id')[0].total
    #.select('SUM(products.precio) as total')[0].total
  end
end