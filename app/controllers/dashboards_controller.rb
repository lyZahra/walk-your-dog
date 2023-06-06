class DashboardsController < ApplicationController
  def show
    @user = User.all
    # @user_subscriptions = UserSubscription.find_active_subscriptions_by_user(@user)
  end

end
