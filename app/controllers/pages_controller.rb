
require 'Matcher'

class PagesController < ApplicationController
  #before_action :authenticate_user!, only: [:home]
  before_action :set_user
  def home
    @pageTitle = "Home"
    if current_user
      @tutors = Tutor.all
      @match = Matcher.matchTutor(@user, @tutors)
    end


  end

  private
  def set_user
    @user = current_user
  end
end
