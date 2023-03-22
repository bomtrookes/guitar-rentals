class RemoveBookingFromChatroom < ActiveRecord::Migration[7.0]
  def change
    remove_reference :chatrooms, :booking, index: true, foreign_key: true
  end
end
