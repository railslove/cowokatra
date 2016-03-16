class AddBudgetToUser < ActiveRecord::Migration
  def change
    add_column :users, :budget, :decimal, precision: 6, scale: 2, default: 0.00
  end
end
