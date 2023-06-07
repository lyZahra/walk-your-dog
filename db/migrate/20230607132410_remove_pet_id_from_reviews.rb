class RemovePetIdFromReviews < ActiveRecord::Migration[7.0]
  def change
    remove_reference :reviews, :pet
  end
end
