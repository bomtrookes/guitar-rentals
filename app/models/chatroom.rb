class Chatroom < ApplicationRecord
  belongs_to :user1, class_name: 'User'
  belongs_to :user2, class_name: 'User'
  belongs_to :guitar
  belongs_to :booking

  has_many :messages
end
