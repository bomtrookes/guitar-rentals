class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :guitar
  has_one :chatroom, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true

  def total_cost
    ((end_date - start_date).to_i + 1) * guitar.cost_per_day
  end
end
