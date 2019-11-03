class TutorsController < ApplicationController
  #before_action :set_tutor, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  def create
    @tutor = @user.build_tutor(tutor_params)
    #save unpermitted parameters from tutor_params 
    @work_experience_array = params[:tutor][:work_experience]
    if @tutor.save 
      #save work_experience hash
      @tutorSaved = @tutor
      @work_experience_array.each do |w|
        @tutorSaved.work_experience.push({
          "company" => w[:company], 
          "location" => w[:location],
          "title" => w[:title],
          "from" => Date.civil(w[:from]["(1i)"].to_i, w[:from]["(2i)"].to_i, w[:from]["(3i)"].to_i),
          "to" => Date.civil(w[:to]["(1i)"].to_i, w[:to]["(2i)"].to_i, w[:to]["(3i)"].to_i)
        })
      end
      @tutorSaved.save
      @user.has_profile = true
      respond_to do |f|
        if @user.save
          f.html {redirect_to user_profile_url, notice: "You have sucessfully created a profile"}  
        else
          puts "No such User"
        end
      end
    else
      render :action => 'profiles/new'
    end
  end

  # PATCH/PUT /tutors/1
  # PATCH/PUT /tutors/1.json
  def update
    @tutor = @user.tutor
    respond_to do |format|
      if @tutor.update(tutor_params)
        format.html { redirect_to user_profile_url, notice: 'Profile was successfully updated.' }
      else
        render :action => 'edit'
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutor
      @tutor = Tutor.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tutor_params
      params.require(:tutor).permit(:headline, :description, :years_teaching , :teaching_style, :work_experience, :education, :subjects, :user_id)

      # params.require(:tutor).permit(:headline, :description, :years_teaching , :teaching_style, :education, :subjects, :user_id).tap do |whitelisted|
      #   whitelisted[:work_experience] = params[:tutor][:work_experience]
      # end
    end
end
