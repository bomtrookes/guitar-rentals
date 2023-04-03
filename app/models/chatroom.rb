class Chatroom < ApplicationRecord
  belongs_to :user1, class_name: 'User'
  belongs_to :user2, class_name: 'User'
  belongs_to :guitar

  has_many :messages, dependent: :destroy

  validates :user1, presence: true
  validates :user2, presence: true

  def latest_message
    last_message = messages.last
    if last_message && last_message.created_at.strftime(('%b %d')) == Time.now.strftime(('%b %d'))
      last_message.created_at.strftime('%H:%M')
    elsif last_message
      last_message.created_at.strftime('%b %d')
    else
      ''
    end
  end
end
