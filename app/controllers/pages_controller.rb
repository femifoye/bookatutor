class PagesController < ApplicationController
  #before_action :authenticate_user!, only: [:home]
  # before_action :set_user
  def home
    @pageTitle = "Home"

  end

  # def set_user
  #   @user = User.find(params[:user_id])
  # end
end
