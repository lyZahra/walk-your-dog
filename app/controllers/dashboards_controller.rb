class DashboardsController < ApplicationController
  def show
    @user = current_user
    # @user_subscriptions = UserSubscription.find_active_subscriptions_by_user(@user)
    @bookings = @user.bookings
    authorize @bookings
  end
end
