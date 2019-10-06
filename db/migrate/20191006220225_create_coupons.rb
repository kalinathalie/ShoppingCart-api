class CreateCoupons < ActiveRecord::Migration[6.0]
  def up
    create_table :coupons do |t|
      t.string :code
      t.float :value
      t.integer :kind
      t.references :purchase

      t.timestamps
    end
  end
  def down
  	drop_table :coupons
  end
end
