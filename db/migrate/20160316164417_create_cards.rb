class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :user_id
      t.string :card_id, index: true

      t.timestamps null: false
    end
  end
end
