class AddBookingIdToInstruments < ActiveRecord::Migration[5.2]
  def change
    add_reference :instruments, :booking, foreign_key: true
  end
end
