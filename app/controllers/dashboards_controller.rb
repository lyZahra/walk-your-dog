class DashboardsController < ApplicationController
  def show
    @user = current_user
    # @user_subscriptions = UserSubscription.find_active_subscriptions_by_user(@user)
    @bookings = @user.bookings
    @bookings_for_my_dogs = Booking.where(pet: current_user.pets)
    @pets = @user.pets
    authorize @bookings
    authorize @pets
  end
end

  #simple form </ booking parameter > call the update through booking controller > use FE display with IF statement
