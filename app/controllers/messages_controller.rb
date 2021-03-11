class MessagesController < ApplicationController
  # before_action :set_user_session
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user

    if @message.save

      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: { message: @message })
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
