class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :guitar

  include PgSearch::Model
  pg_search_scope :search_user_favourites,
    against: [ :name, :caption, :description, :guitar_type ],
    using: {
      tsearch: { prefix: true }
  }
end
