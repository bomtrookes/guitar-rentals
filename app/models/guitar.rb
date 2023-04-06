class Guitar < ApplicationRecord
  include ActionView::Helpers

  belongs_to :user
  has_many :users, through: :favourites
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many_attached :photos, dependent: :destroy

  has_many :chatrooms, dependent: :destroy

# Published Guitars Search
  include PgSearch::Model
  pg_search_scope :search_published_guitars,
    against: [ :name, :caption, :description, :guitar_type ],
    using: {
      tsearch: { prefix: true }
    },
    associated_against: {
      user: [:name, :username]
    },
    :conditions => lambda { |guitar| { published: true } }

  # Favourites Search
  include PgSearch::Model
  pg_search_scope :search_user_favourites,
    against: [:name, :caption, :description, :guitar_type],
    associated_against: {
      favourites: [:user_id]
    },
    using: {
      tsearch: { prefix: true }
    }

  def average_rating
    reviews.length == 0 ? "" : "#{content_tag(:i, "", class: "bi bi-star")} #{reviews.average(:rating).round(1)}".html_safe
  end

end
