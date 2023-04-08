class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :guitar

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :booking_dates_cannot_be_in_the_past
  validate :booking_dates_cannot_overlap

  def total_cost
    ((end_date - start_date).to_i + 1) * guitar.cost_per_day
  end

  def booking_dates_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
    if end_date.present? && end_date < Date.today
      errors.add(:end_date, "can't be in the past")
    end
  end

  def booking_dates_cannot_overlap
    if guitar && start_date && end_date
      overlapping_bookings = guitar.bookings.where.not(id: id)
        .where("(start_date <= ? AND end_date >= ?) OR (start_date >= ? AND start_date <= ?)", end_date, start_date, start_date, end_date)
      if overlapping_bookings.any?
        errors.add(:base, "This guitar is already booked for the selected dates")
      end
    end
  end

  def num_days
    num = (end_date - start_date).to_i
    if num == 1
      "£#{guitar.cost_per_day} x #{num} day"
    else
      "£#{guitar.cost_per_day} x #{num} days"
    end
  end
end
