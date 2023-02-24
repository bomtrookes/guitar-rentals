class RemoveFlatFromBooking < ActiveRecord::Migration[7.0]
  def change
    remove_reference :bookings, :flat, null: false, foreign_key: true
  end
end
