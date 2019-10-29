class ProfilesController < ApplicationController
    before_action :set_user
    before_action :set_prop

    def index
        @profile = send @prop[:show]
        render "#{@prop[:render]}/index"
    end


    def new
        if @user.has_profile == true
            redirect_to user_profile_url, :notice => "You have already created a profile"
        else
        @profile = send @prop[:build]
        render "#{@prop[:render]}/new"
        end
    end


    def show
        @profile = send @prop[:show]
        render "#{@prop[:render]}/show"
    end


    def edit
        @profile = send @prop[:show]
        render "#{@prop[:render]}/edit"
    end



    def destroy
        @profile = send @prop[:show]
        respond_to do |format|
            if @profile.destroy
                format.html { redirect_to root_url, notice: 'Your profile has been sucessfully deleted' }
                format.json { head :no_content }
            end
        end
    end




    private
    def set_user
        @user = User.find(params[:user_id])
    end

    def get_user_role
        @user.role
    end

    def switch_role(student_action, tutor_action)
        case @prop[:role]
        when "student"
            student_action
        when "tutor"
            tutor_action
        else
            puts 'You have selected an invalid option'
        end 
    end

    def run_build()
        switch_role(@user.build_tutor(), @user.build_tutor())
    end

    def run_show()
        switch_role(@user.tutor(), @user.tutor())
    end

    def set_prop
        if get_user_role == "student"
            
            @prop = {
                :role => "student",
                :build => "run_build",
                :show => "run_show",
                :render => "tutors"
            }
        else

            @prop = {
                :role => "tutor",
                :build => "run_build",
                :show => "run_show",
                :render => "students/"
            }
        end
    end
end