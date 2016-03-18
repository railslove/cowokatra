class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :user_id, index: true
      t.decimal :amount, precision: 6, scale: 2

      t.timestamps null: false
    end
  end
end
