class BadgeTwoController < ApplicationController
  def index
    @user = User.find(params[:id])
    data = Api.post_credly_badge_2(params[:id], @user.name)
  end
end
