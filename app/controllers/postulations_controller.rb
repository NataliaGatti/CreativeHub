class PostulationsController < ApplicationController

  def index
    @project = Project.find(params[:project_id])
    # @postulations = Postulation.where(@project.user== current_user)
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
    @postulation.status = 0
    if @postulation.save
      flash[:alert] = "Tu postulación ha sido enviada exitosamente"
      redirect_to projects_path
    else
      flash[:alert] = "Falta información en tu postulación"
      render :new  
    end
  end

  def my_postulations
    if !current_user.company
      @postulations = current_user.postulations
      
      @rejectPostulations = @postulations.select do |post|
        post.status == "Declinado"
      end

      @aceptedPostulations = @postulations.select do |post|
        post.status == "Aceptado"
      end

      @watingPostulations = @postulations.select do |post| 
        post.status == "Postulado"
      end
    else
      redirect_to projects_path
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
      redirect_to my_projects_postulations_path(@postulation.project.id)
     else
      render 'postulations/alert'
     end
  end
  
  
  private
  
  
  def postulation_params
   params.require(:postulation).permit(:file, :description, :status, :project_id, :user_id)
  end

end
