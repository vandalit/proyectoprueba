class ShoppingCartProduct < ApplicationRecord
  belongs_to :ShoppingCart
  belongs_to :product
end
