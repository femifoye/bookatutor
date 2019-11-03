class TutorsController < ApplicationController
  #before_action :set_tutor, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  def create
    @tutor = @user.build_tutor(tutor_params)
    #work_experience_array = params[:work_experience]
    if @tutor.save 
      #@user.tutor.work_experience = work_experience_array
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
      debugger
      params.require(:tutor).permit(:headline, :description, :years_teaching , :teaching_style, :company, :location, :education, :subjects, :user_id)

      # params.require(:tutor).permit(:headline, :description, :years_teaching , :teaching_style, :education, :subjects, :user_id).tap do |whitelisted|
      #   whitelisted[:work_experience] = params[:work_experience].permit!
      # end
    end
end
