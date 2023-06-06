class Review < ApplicationRecord
  belongs_to :booking, :pet
end
