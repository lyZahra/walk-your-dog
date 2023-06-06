class DashboardsController < ApplicationController
  # After login and entering a pet >> user become owner (admin?)
  def show
    # params[:id] == current_user.id unless params[:id]
    @user = current_user.booking
    # @user_subscriptions = UserSubscription.find_active_subscriptions_by_user(@user)
  end

  # Access to a dashboard with lists of all previous bookings (marked as done)

  # Bookings displays user.name, user.email, pet.user.email, dog.name, marked as done

  # Bookings waiting for approval >> F-E

  # Possibility for the owner to edit the booking (approve, refuse, update, delete, add a review for the user ?)
end
