class MessagesController < ApplicationController
  #before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :show, :new, :edit, :create, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = @user.messages
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = @user.messages.find(params[:id])
  end

  # GET /messages/new
  def new
    @message = @user.messages.build
  end

  # GET /messages/1/edit
  def edit
    @message = @user.messages.find(params[:id])
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = @user.messages.build(message_params)
    if @message.save
      redirect_to user_message_url(@user, @message)
    else
      render :action => new
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    @message = Message.find(params[:id])
    if @message.update_attributes(message_params)
      redirect_to user_message_url(@user, @message)
    else
      render :action => 'edit'
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    respond_to do |format|
      format.html { redirect_to user_messages_path(@user), notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:message_to, :message_from, :status, :user_id)
    end
end
