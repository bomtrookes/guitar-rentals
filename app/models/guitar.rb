class Guitar < ApplicationRecord
  include ActionView::Helpers

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many_attached :photos, dependent: :destroy

  has_many :chatrooms, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_all_guitars,
    against: [ :name, :caption, :description, :guitar_type ],
    using: {
      tsearch: { prefix: true }
  }

  def average_rating
    reviews.length == 0 ? "" : "#{content_tag(:i, "", class: "bi bi-star")} #{reviews.average(:rating).round(1)}".html_safe
  end

end
