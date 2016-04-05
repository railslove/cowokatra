class AddBookingDateToPayment < ActiveRecord::Migration
  def up
    add_column :payments, :booked_at, :datetime

    if table_exists? :payments
      ActiveRecord::Base.connection.execute('UPDATE payments SET booked_at = created_at')
    end
  end

  def down
    drop_column :payments, :booked_at
  end
end
