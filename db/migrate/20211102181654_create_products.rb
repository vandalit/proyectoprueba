class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :codigo
      t.string :nombre
      t.string :stock, default: 0
      t.integer :precio, precision: 10, scale: 2, default: 0 

      t.timestamps
    end
  end
end
