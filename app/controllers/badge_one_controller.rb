class BadgeOneController < ApplicationController
  def index
    @user = User.find(params[:id])
    p params[:id], @user.name
    data = Api.post_credly_badge_1(params[:id], @user.name)
    p data
  end
end
