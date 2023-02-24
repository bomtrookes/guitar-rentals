class RemoveUserFromReviews < ActiveRecord::Migration[7.0]
  def change
    remove_reference :reviews, :flat, null: false, foreign_key: true
  end
end
