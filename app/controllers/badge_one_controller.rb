class BadgeOneController < ApplicationController
  def index
    @user = User.find(params[:id])
    data = Api.post_credly_badge_1(params[:id], @user.name)
  end
end
