class CreatePurchases < ActiveRecord::Migration[6.0]
  def up
    create_table :purchases do |t|
      t.string :token
      t.timestamps
    end
  end
  def down
  	drop_table :purchases
  end
end
