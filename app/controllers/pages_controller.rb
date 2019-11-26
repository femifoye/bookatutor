
require 'Matcher'
require 'BAT_Notifications'

class PagesController < ApplicationController
  #before_action :authenticate_user!, only: [:home]
  before_action :set_user
  def home
    @pageTitle = "Home"
    if (@user and @user.role == "Student")
      set_tutors
      @match = Matcher.matchTutor(@user, @tutors)
      @tutors_to_recommend = []
      @match.each do |m|
        if(m["competency_match"].length > 0)
          @tutors_to_recommend.push(m["tutor"])
        end
      end
    end
    @users = User.all


  end

  def dashboard
    
  end

  def tutors
    set_tutors
  end

  private
  def set_user
    @user = current_user
  end

  def set_tutors
    @tutors = Tutor.all
  end
end
