class PostulationsController < ApplicationController

  def index
    @project = Project.find(params[:project_id])
    @postulations =  @project.postulations
  end

  def show
    @postulation = Postulation.find(params[:id])
  end
  
  def new
    @postulation = Postulation.new
    @project = Project.find(params[:project_id])
  end
  
  def create
    @project = Project.find(params[:project_id])
    @postulation = Postulation.new(postulation_params)
    @postulation.project = @project
    @postulation.user = current_user
    # @postulation.status = 0
    if @postulation.save
      sleep(4)
      redirect_to projects_path
    else  
      render 'postulations/alert'
    end
  end
  
  def accept_project
    @postulation = Postulation.find(params[:id])
    @postulation.status = 1
    @project = @postulation.project
    @project.status = 1
    @project.save
    if @postulation.save
       redirect_to project_postulations_path(@postulation.project)
     else
      render 'postulations/alert'
     end
  end

  def decline_project
    @postulation = Postulation.find(params[:id])
    @postulation.status = 2
    @project = @postulation.project
    @project.status = 1
    @project.save
    if @postulation.save
      redirect_to project_postulations_path(@postulation.project)
     else
      render 'postulations/alert'
     end
  end
  
  private
  
  def postulation_params
   params.require(:postulation).permit(:file, :description, :status, :project_id, :user_id)
  end

end
