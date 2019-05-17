class AddDetailsToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :checkin, :date
    add_column :bookings, :checkout, :date
    add_column :bookings, :value, :integer
    add_column :bookings, :status, :string
  end
end
