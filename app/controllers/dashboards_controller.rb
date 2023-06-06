class DashboardsController < ApplicationController
  # After login and entering a pet >> user become owner (admin?)
  def show
    params[:id] == current_user.id unless params[:id]
    @user = User.find(params[:id])
    @user_subscriptions = UserSubscription.find_active_subscriptions_by_user(@user)
  end

  # Access to a dashboard with lists of all previous bookings (marked as done)

  # Bookings displays user.name, dog.name, marked as done

  # Bookings waiting for approval

  # Possibility for the owner to edit the booking (approve, refuse, update, delete, add a review for the user ?)
end
