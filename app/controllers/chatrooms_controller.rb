class ChatroomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatroom, only: [:show, :destroy]
  before_action :set_chatrooms, only: [:index, :show]
  before_action :set_user, only: [:index, :show]
  before_action :require_participant, only: [:show]

  def index
  end

  def show
    @user = current_user
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @messages = @chatroom.messages.where(user: [@user, @chatroom.guitar.user])
  end

  def create
    guitar = Guitar.find(params[:guitar_id])
    recipient = guitar.user

    # Check if there's an existing chatroom between the current user and the recipient
    @chatroom = Chatroom.find_by(user1: current_user, user2: recipient, guitar: guitar)

    # If there's no existing chatroom, create a new one
    unless @chatroom
      @chatroom = Chatroom.new(user1: current_user, user2: recipient, guitar: guitar)
      puts @chatroom.errors.full_messages
      if @chatroom.save
        puts @chatroom.errors.full_messages
        redirect_to guitar_chatroom_path(guitar_id: guitar.id, id: @chatroom.id)
        return
      else
        puts @chatroom.errors.full_messages
        # If the chatroom couldn't be saved, handle the error and display a message
        flash[:error] = "An error occurred while creating the chatroom."
        redirect_to guitars_path
        return
      end
    end

    puts @chatroom.errors.full_messages
    # If the chatroom already exists, redirect to it
    redirect_to guitar_chatroom_path(guitar_id: guitar.id, id: @chatroom.id)
  end


  def destroy
    @chatroom = Chatroom.find(params[:id])
    @chatroom.destroy
    redirect_to chatrooms_path
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:user1_id, :user2_id, :guitar)
  end

  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
  end

  def set_chatrooms
    @chatrooms = Chatroom.joins(:messages)
    .select('chatrooms.*, MAX(messages.created_at) AS latest_message_time')
    .where('user1_id = ? OR user2_id = ?', current_user.id, current_user.id)
    .group('chatrooms.id')
    .order('latest_message_time DESC')
  end

  def require_participant
    @chatroom = Chatroom.find(params[:id])
    unless current_user && (@chatroom.user1_id == current_user.id || @chatroom.user2_id == current_user.id)
      flash[:error] = "You are not authorized to view this chatroom."
      redirect_to root_path
    end
  end

  def set_user
    @user = current_user
  end
end
