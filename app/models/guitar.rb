class Guitar < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many_attached :photos

  include PgSearch::Model
  pg_search_scope :search_all_guitars,
    against: [ :name, :caption, :description, :guitar_type, :address ],
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
