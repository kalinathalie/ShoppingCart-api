class CreateRegisteredProducts < ActiveRecord::Migration[6.0]
  def up
    create_table :registered_products do |t|
      t.string :name
      t.float :prize
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
  def down
  	drop_table :registered_products
  end
end
