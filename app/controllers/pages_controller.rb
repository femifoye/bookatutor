
require 'Matcher'

class PagesController < ApplicationController
  #before_action :authenticate_user!, only: [:home]
  before_action :set_user
  def home
    @pageTitle = "Home"
      @tutors = Tutor.all
      debugger
      @match = Matcher.matchTutor(@user, @tutors)


  end

  private
  def set_user
    @user = current_user
  end
end
