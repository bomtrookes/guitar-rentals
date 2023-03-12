class Review < ApplicationRecord
  belongs_to :user
  belongs_to :guitar

  validates :comment, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validate :user_can_only_submit_one_review_per_guitar

  private

  def user_can_only_submit_one_review_per_guitar
    # if Review.exists?(user_id: user_id, guitar_id: guitar_id)
    #   errors.add(:base, "You can only submit one review per guitar.")
    # end
  end
end
