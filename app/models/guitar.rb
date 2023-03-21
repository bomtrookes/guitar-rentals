class Guitar < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many_attached :photos

  has_many :chatrooms

  include PgSearch::Model
  pg_search_scope :search_all_guitars,
    against: [ :name, :caption, :description, :guitar_type ],
    using: {
      tsearch: { prefix: true }
  }

  def average_rating
    if reviews.length == 0
      "-"
    else
      "⭐️#{reviews.average(:rating).to_f.round(1)}"
    end
  end
end
