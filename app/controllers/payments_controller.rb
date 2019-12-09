class PaymentsController < ApplicationController
  #before_action :set_payment, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  before_action :ensure_admin, only: [:edit, :update, :destroy]

  # GET /payments
  # GET /payments.json
  def index
    @payments = @user.payments
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
    @payment = @user.payments.find(params[:id])
  end

  # GET /payments/new
  def new
    @payment = @user.payments.build
  end

  # GET /payments/1/edit
  def edit
    @payment = @user.payments.find(params[:id])
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = @user.payments.build(payment_params)
    if @payment.save
    redirect_to user_payment_url(@user, @payment)
    else
    render :action => "new"
    end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    @payment = Payment.find(params[:id])
    if @payment.update_attributes(payment_params)
      redirect_to user_payment_url(@user, @payment)
    else
      render :action => 'edit'
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to user_payments_path(@user), notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end
    def set_user
      @user = User.find(params[:user_id])
    end

    #ensure user is admin else redirect back
    def ensure_admin
      unless current_user && current_user.admin
        flash[:notice] = "You are not authorized to perform this action"
        redirect_back(fallback_location: root_path)
      end

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:amount, :receiver, :refunded, :completed, :user_id)
    end
end
