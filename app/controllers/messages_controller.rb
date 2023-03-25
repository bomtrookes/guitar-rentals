class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatroom, only: [:index, :create, :show]
  before_action :set_message, only: [:show]
  before_action :set_user, only: [:create]

  def index
    @messages = @chatroom.messages
    render json: @messages

  end

  def show
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.sender = current_user
    @message.receiver = @chatroom.user1 == current_user ? @chatroom.user2 : @chatroom.user1

    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: {message: @message})
      )
      head :ok
    else
      render 'chatrooms/show', status: :unprocessable_entity
    end
    # handle AJAX
    # respond_to do |format|
    #   if @message.save
    #     format.html { redirect_to guitar_chatroom_path(@chatroom.guitar, @chatroom) }
    #     format.json # looks for create.json.jbuilder
    #   else
    #     format.html { render 'chatrooms/show', status: :unprocessable_entity }
    #     format.json
    #   end
    # end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end

  def set_user
    @user = current_user
  end
end
