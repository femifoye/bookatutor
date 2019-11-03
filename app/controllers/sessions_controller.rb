class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :index, :edit, :update, :endsession, :destroy, :details]
  before_action :set_booking
  before_action :set_user

  # GET /sessions
  # GET /sessions.json
  def index
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
  end

  # GET /sessions/new
  def new
    @session = @booking.build_session()
  end

  # GET /sessions/1/edit
  def edit
  end

  def details
  end

  # POST /sessions
  # POST /sessions.json
  def create
    @session = @booking.build_session(session_params)
    respond_to do |format|
      if @session.save
        format.html { redirect_to user_booking_sessions_url, notice: 'Session was successfully created.' }
      else
        render :action => 'new'
      end
    end
  end

  # PATCH/PUT /sessions/1
  # PATCH/PUT /sessions/1.json
  def update
    respond_to do |format|
      if @session.update(session_params)
        format.html { redirect_to user_booking_session_url, notice: 'Session was successfully updated.' }
      else
        render :action => 'edit'
      end
    end
  end

  def endsession
    if session_started
      @session.end = Time.now
      respond_to do | format |
        if @session.save
          format.html { redirect_to user_booking_session_detail_path(@user, @booking, @session), notice: "You have ended your session. Here are your session details."}
        else
          puts "Unable to End session"
        end
      end
    else
      flash[:notice] = "You cannot end a session that hasn't started"
      redirect_to user_booking_session_url
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    @session.destroy
    respond_to do |format|
      format.html { redirect_to user_bookings_path(@user, @bookings), notice: 'Session was successfully cancelled.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = @booking.session()
    end

    def set_booking
      @booking = Booking.find(params[:booking_id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def session_started
      @session.start != nil
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.require(:session).permit(:start, :end, :members, :references)
    end
end
