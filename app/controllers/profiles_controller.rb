


class ProfilesController < ApplicationController
    before_action :set_user
    before_action :set_prop
    before_action :authenticate_user!


    def index
        @profile = send @prop[:show]
        if @user != current_user
            render "#{@prop[:render]}/show"
        else
            render "#{@prop[:render]}/index"
        end
    end


    def new
        
        #check if user has profile. Redirect to user profile if true
        if @user.has_profile == true
            redirect_to user_profile_url, :notice => "You have already created a profile"
        else
        @profile = send @prop[:build]
        #get all subjects and store in instance var @subject
        @subjects = Subject.all.order('subject_name ASC')
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
                @user.has_profile = false
                if @user.save
                    format.html { redirect_to root_url, notice: 'Your profile has been sucessfully deleted' }
                else
                    puts 'No such User'
                end    
            else
                puts 'Error deleting Profile'
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
        when "Tutor"
            tutor_action
        else
            puts 'You have selected an invalid option'
        end 
    end

    def run_build()
        switch_role(@user.build_student(), @user.build_tutor())
    end

    def run_show()
        switch_role(@user.student(), @user.tutor())
    end

    def set_prop
        user_role = get_user_role
        if user_role == "Student"
            @prop = {
                :role => "student",
                :build => "run_build",
                :show => "run_show",
                :render => "students"
            }
        else

            @prop = {
                :role => "Tutor",
                :build => "run_build",
                :show => "run_show",
                :render => "tutors"
            }
        end
    end
end