class CreateBrands < ActiveRecord::Migration[6.1]
  def change
    create_table :brands do |t|
      t.string :clave
      t.string :nombre

      t.timestamps
    end
  end
end
