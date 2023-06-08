class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user
<<<<<<< HEAD
  has_many :reviews, dependent: :destroy
=======
  has_one :review, dependent: :destroy
  # STATUSES = %i[pending accepted denied completed].map(&:to_s).freeze
  # validates :quote_requestor, inclusion: { in: Booking::STATUSES }
>>>>>>> master
end
