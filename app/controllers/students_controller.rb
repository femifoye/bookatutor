class StudentsController < ApplicationController
  #before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  def create
    @student = @user.build_student(student_params)
    @subject_competency_array = params[:student][:subjects_of_interest]
    @student.save 
    @subject_competency_array.each do |s|
      debugger
      @student.subjects_of_interest.push({
        "subject" => s[:subject],
        "competency" => s[:competency]
      })
    end
    @student.save
     @user.has_profile = true
      respond_to do |f|
        if @user.save
          f.html {redirect_to user_profile_url, notice: "You have sucessfully created a profile"}  
        else
          puts "No such User"
        end
      end
    # else
    #   render :action => 'profiles/new'
    # end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    @student = @user.student
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to user_profile_url, notice: 'Profile was successfully updated.' }
      else
        render :action => 'new'
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:education_level, :description, :subjects_of_interest, :user_id)
    end
end
