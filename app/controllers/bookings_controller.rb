require 'BAT_Notifications'
require 'geocoder'
require 'certified'

class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  before_action :set_user_booked

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

  def book
    #get information on booking
    #get date value from form
    date = DateTime.civil(
      params[:booking]["date(1i)"].to_i,
      params[:booking]["date(2i)"].to_i,
      params[:booking]["date(3i)"].to_i,
      params[:booking]["date(4i)"].to_i,
      params[:booking]["date(5i)"].to_i,
    )
    #get location values from form // street address, city and postal
    street_address = params[:booking][:booking_location][0]["street_address"]
    city = params[:booking][:booking_location][0]["city"]
    postal_code = params[:booking][:booking_location][0]["postal_code"]
    #extract long and lat values from address using Geocoder gem
    full_address = street_address+", "+city
    location = Geocoder.search(full_address)
    latitude = location[0].data["lat"]
    longitude = location[0].data["lon"]
    #get hours booked
    hours_booked = params[:booking]["hours_booked"]
    #set userID of user who initiated booking
    user_id = current_user.id
    #set userID of user booked
    user_booked_id = @user_booked.id
    #save all database parameters in a hash
    params_booking = {
      "date" => date,
      "location" => {"longitude" => longitude, "latitude" => latitude},
      "hours_booked" => hours_booked,
      "user_booked" => user_booked_id
    }
    #save data to database
    @booking = @user.bookings.create(params_booking)
    respond_to do |format|
      if @booking.save
        #get the Tutor profile of the tutor booked
        tutor_booked = Tutor.where(user_id: [user_booked_id])
        #update the date booked to include new date and user who initiated booking
        dates_booked_info = {
          "date" => date,
          "booked_by" => current_user.id
        }

        #add new data to database and update
        tutor_booked[0].dates_booked.push(dates_booked_info)
        if tutor_booked[0].save
          #initiate notification decorator
          self.init_notification
          #send notification to tutor booked
          @notification.send_notification_to_receiver
          #decorate notification to send notification to user 
          @notification = UserBookingNotification.new(@notification)
          #send notification to user
          @notification.send_notification_to_sender
        else
          render :action => 'new', :notice => "Error! Unable to save Tutor information"
        end
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

  def init_notification
    user_booking = @user
    user_booked  = @user_booked
    content = @booking
    @notification = BAT_Notification.new(user_booking, user_booked, content)
    @notification = BookingNotification.new(@notification)
    return @notification
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def set_user
      @user = current_user
    end

    def set_user_booked
      @user_booked = User.find(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:date, :location, :user_id, :user_booked)
    end
end
