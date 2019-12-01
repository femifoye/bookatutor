
class AxiosController < ApplicationController
    def get_tutor_from_id
        tutor_id = params[:id]
        @tutor = User.find(tutor_id)
        respond_to do |format|
            format.json {render json: @tutor.tutor}
        end
    end

    def get_booking_info
        booking_id = params[:id]
        @booking = Booking.find(booking_id)
        respond_to do |format|
            format.json {render json: @booking}
        end
    end

    # def create_review
    #     debugger
    #     # @review = @user.reviews.build(review_params)
    #     # respond_to do |format|
    #     #     if @review.save
    #     #         format.html { redirect_to user_review_path(@user, @review), notice: "Review was successfully created"}
    #     #     else
    #     #         render :action => 'new'
    #     #     end
    #     # end
    # end
end

