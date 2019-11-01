class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = @user.bookings.all
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
    @booking = @user.bookings.find(params[:id])
  end

  # GET /bookings/new
  def new
    @booking = @user.bookings.build
  end

  # GET /bookings/1/edit
  def edit
    @booking = @user.bookings.find(params[:id])
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = @user.bookings.build(booking_params)
    respond_to do |format|
      if @booking.save
        format.html { redirect_to user_booking_url(@user, @booking), notice: 'Your Booking was successful' }
      else
        render :action => 'new'
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    @booking = Booking.find(params[:id])
    respond_to do |format|
      if @booking.update_attributes(booking_params)
        format.html { redirect_to user_booking_url(@user, @booking), notice: 'Your Booking has been successfully updated' }
      else
        render :action => 'edit'
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to user_bookings_path(@user), notice: 'Booking was successfully cancelled.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:date, :location, :user_id, :user_booked)
    end
end
