class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatroom, only: [:index, :create, :show]
  before_action :set_message, only: [:show]

  def index
    @messages = Message.all
  end

  def show
    @message = Message.new
  end

  def create
    @user = current_user
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.sender = current_user
    @message.receiver = @chatroom.user1 == current_user ? @chatroom.user2 : @chatroom.user1
    if @message.save
      redirect_to guitar_chatroom_path(@chatroom.guitar, @chatroom)
    else
      render 'chatrooms/show'
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end
end
