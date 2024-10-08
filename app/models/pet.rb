class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def average_rating
    if reviews.present?
      average = reviews.map(&:rating).sum / reviews.count
      # return "#{average.round(1)} stars"
    else
      "No reviews yet"
    end
  end
end
