class MessagesController < ApplicationController
  # before_action :set_user_session
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user

    if @message.save!

      message_data = {
        user_id: @message.user.id,
        message_id: @message.id,
        message_created_at: @message.created_at.strftime("%a %b %e at %l:%M%p"),
        message_user_name: @message.user.name,
        message_content: @message.content
      }

      ChatroomChannel.broadcast_to(
        @chatroom,
        [current_user.id, message_data]
      )

      redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
    else
      render "chatrooms/show"
    end
    
  end

  # def set_user_session
  #   session[:user_id] = current_user.id
  # end
  

  private

  def message_params
    params.require(:message).permit(:content)
  end
  
end
