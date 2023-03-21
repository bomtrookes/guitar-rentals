class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :guitars
  has_many :reviews
  has_many :bookings

  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'
  has_many :received_messages, class_name: 'Message', foreign_key: 'receiver_id'

  has_many :chatrooms_as_user1, class_name: 'Chatroom', foreign_key: 'user1_id'
  has_many :chatrooms_as_user2, class_name: 'Chatroom', foreign_key: 'user2_id'

end
