class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  before_action :set_user_reviewed, only: [:create]
  before_action :ensure_admin, only: [:destroy, :edit, :update]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = @user.reviews.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @review = @user.reviews.find(params[:id])
  end

  # GET /reviews/new
  def new
    @review = @user.reviews.build
  end

  # GET /reviews/1/edit
  def edit
    @review = @user.reviews.find(params[:id])
  end

  # POST /reviews
  # POST /reviews.json
  def create
    #get parameters from the reviews form sent with ajax
    
    
      if @review = @user.reviews.create(review_params)
        respond_to do |format|
          format.html { redirect_to user_review_path(@user, @review), notice: "Review was successfully created"}
        end
      else
        render :action => 'new'
      end

    
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    @review = @user.reviews.find(params[:id])

    respond_to do |format|
      if @review.update_attributes(review_params)
        format.html { redirect_to user_review_path(@user, @review), notice: 'Review was successfully updated.' }
      else
        render :action => 'edit'
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    respond_to do |format|
      format.html { redirect_to user_reviews_path(@user), notice: 'Review was successfully destroyed.' }
    end
  end

  def init_notification
    reviewer = current_user
    reviewee = @user_reviewed
    content = @review
    @notification = BAT_Notification.new(reviewer, reviewee, content)
    @notification = ReviewNotification.new(@notification)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_user_reviewed
      @user_reviewed = User.find(params[:reviewee])
    end

    #ensure user is admin else redirect back
    def ensure_admin
      unless current_user && current_user.admin
        flash[:notice] = "You are not authorized to perform this action"
        redirect_back(fallback_location: root_path)
      end

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:reviewee, :review_content, :review_stars, :user_id)
    end
end
