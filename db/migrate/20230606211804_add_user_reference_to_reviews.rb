class AddUserReferenceToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :pet
  end
end
