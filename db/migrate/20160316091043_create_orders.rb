class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :product_id
      t.decimal :price, precision: 6, scale: 2
      t.boolean :deducted

      t.timestamps null: false
    end
  end
end
