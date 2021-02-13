class ProjectsController < ApplicationController

  before_action :project_by_params_id, only: [:show,:edit, :update]

  def index
    @projects = Project.all
  end

  def show

  end

  def new
    @project = Project.new
  end

  def create
     @project = Project.new(project_params)
      @project.user = current_user
     if @project.save
      redirect_to project_path(@project)
     else
      render :new
     end
  end
  
  def edit
  end

  def update
    @project.update(project_params)
     if @project.save
      redirect_to project_path(@project)
     else
      render :edit
     end
  end

  # def unpublish
  #   @project.status = 1
  #   if @project.save
  #     redirect_to project_path(@project)
  #    else
  #     render :edit
  #    end
  # end

private

  def project_by_params_id
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :cost, :deadline, :status)
  end

end