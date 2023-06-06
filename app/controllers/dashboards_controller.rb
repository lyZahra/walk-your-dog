class DashboardsController < ApplicationController
  def show
    # params[:id] == current_user.id unless params[:id]
    @user = current_user.booking
    # @user_subscriptions = UserSubscription.find_active_subscriptions_by_user(@user)
  end

end
