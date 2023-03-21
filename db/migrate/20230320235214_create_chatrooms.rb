class CreateChatrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :chatrooms do |t|
      t.references :user1, foreign_key: { to_table: :users }
      t.references :user2, foreign_key: { to_table: :users }
      t.references :guitar, foreign_key: true
      t.references :booking, foreign_key: true
      t.timestamps
    end
  end
end
