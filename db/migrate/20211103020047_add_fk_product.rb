class AddFkProduct < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :brands, foreign_key: true
  end
end
