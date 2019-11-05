class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :index, :edit, :update, :endlesson, :destroy, :details]
  before_action :set_booking
  before_action :set_user

  # GET /lessons
  # GET /lessons.json
  def index
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
  end

  # GET /lessons/new
  def new
    @lesson = @booking.build_lesson()
  end

  # GET /lessons/1/edit
  def edit
  end

  def details
  end

  # POST /lessons
  # POST /lessons.json
  def create
    @lesson = @booking.build_lesson(lesson_params)
    respond_to do |format|
      if @lesson.save
        format.html { redirect_to user_booking_lessons_url, notice: 'lesson was successfully created.' }
      else
        render :action => 'new'
      end
    end
  end

  # PATCH/PUT /lessons/1
  # PATCH/PUT /lessons/1.json
  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to user_booking_lesson_url, notice: 'lesson was successfully updated.' }
      else
        render :action => 'edit'
      end
    end
  end

  def endlesson
    if lesson_started
      @lesson.end = Time.now
      respond_to do | format |
        if @lesson.save
          format.html { redirect_to user_booking_lesson_detail_path(@user, @booking, @lesson), notice: "You have ended your lesson. Here are your lesson details."}
        else
          puts "Unable to End lesson"
        end
      end
    else
      flash[:notice] = "You cannot end a lesson that hasn't started"
      redirect_to user_booking_lesson_url
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to user_bookings_path(@user, @bookings), notice: 'lesson was successfully cancelled.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = @booking.lesson()
    end

    def set_booking
      @booking = Booking.find(params[:booking_id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def lesson_started
      @lesson.start != nil
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_params
      params.require(:lesson).permit(:start, :end, :members, :references)
    end
end
