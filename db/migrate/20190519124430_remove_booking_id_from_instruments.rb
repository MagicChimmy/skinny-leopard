class RemoveBookingIdFromInstruments < ActiveRecord::Migration[5.2]
  def change
    remove_column :instruments, :booking_id, :bigint
  end
end
