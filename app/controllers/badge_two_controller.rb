class BadgeTwoController < ApplicationController
  def index
    Api.post_credly_badge_2()
  end
end
