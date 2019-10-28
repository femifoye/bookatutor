class TutorsController < ApplicationController
  #before_action :set_tutor, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  # GET /tutors
  # GET /tutors.json
  def index
    @tutor = @user.tutor
  end

  # GET /tutors/1
  # GET /tutors/1.json
  def show
    @tutor = @user.tutor
  end

  # GET /tutors/new
  def new
    @has_tutor = @user.tutor
    if @has_tutor != nil
      redirect_to user_profile_url, :notice => "You have already created a profile"
    else
      @tutor = @user.build_tutor()
    end 
  end

  # GET /tutors/1/edit
  def edit
    @tutor = @user.tutor
  end

  # POST /tutors
  # POST /tutors.json
  def create
    @tutor = @user.build_tutor(tutor_params)
    respond_to do |f|
      if @tutor.save 
        f.html {redirect_to user_profile_url, notice: "You have sucessfully created a profile"}  
      else
        render :action => 'new'
      end
    end
    


    # respond_to do |format|
    #   if @tutor.save
    #     format.html { redirect_to @tutor, notice: 'Tutor was successfully created.' }
    #     format.json { render :show, status: :created, location: @tutor }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @tutor.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /tutors/1
  # PATCH/PUT /tutors/1.json
  def update
    @tutor = @user.tutor
    respond_to do |format|
      if @tutor.update(tutor_params)
        format.html { redirect_to user_profile_url, notice: 'Profile was successfully updated.' }
      else
        render :action => 'new'
      end
    end
  end

  # DELETE /tutors/1
  # DELETE /tutors/1.json
  def destroy
    @tutor = @user.tutor
    respond_to do |format|
      if @tutor.destroy
      format.html { redirect_to root_url, notice: 'Your profile has been sucessfully deleted' }
      format.json { head :no_content }
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
      params.require(:tutor).permit(:headline, :description, :years_teaching, :teaching_style, :work_experience, :education, :subjects, :user_id)
    end
end
