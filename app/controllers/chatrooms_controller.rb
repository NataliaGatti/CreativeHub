class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new

    index
  end

  def create 
    @chatroom = Chatroom.new
    # raise
    # @chatroom.project = Project.find(params[:project_id])
    @chatroom.designer = current_user
    @chatroom.company = Project.find(params[:project_id]).user
    @chatroom.name = "#{Project.find(params[:project_id]).title} - #{current_user.name}"
    @chatroom.project_id = params[:project_id]
    # raise
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      redirect_to projects_path
    end
    # raise
  end

  def index
    if !current_user.company
      @chatrooms = Chatroom.all.where(["designer_id = ?", current_user.id])
    else
      @chatrooms = Chatroom.all.where(["company_id = ?", current_user.id])
    end
  end
  
  
end
