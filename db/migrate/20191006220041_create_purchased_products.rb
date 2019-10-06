class CreatePurchasedProducts < ActiveRecord::Migration[6.0]
  def up
    create_table :purchased_products do |t|
      t.float :kilogram
      t.belongs_to :purchase, null: false, foreign_key: true
      t.belongs_to :registered_product

      t.timestamps
    end
  end
  def down
  	drop_table :purchased_products
  end
end
