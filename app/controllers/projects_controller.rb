class ProjectsController < ApplicationController

  before_action :project_by_params_id, only: [:show,:edit, :update, :unpublish]

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
      params[:categories].shift
      params[:categories].each do |id|
        category = Category.find(id.to_i)
        CategoryProject.create(project: @project, category: category )
      end
      redirect_to project_path(@project)
     else
      render :new
    end
  end
  
  def edit
  end

  def update
    @project.categories.clear
    @project.update(project_params)
    if params[:categories] != [""]
      params[:categories].delete_at(0)
      params[:categories].each do |id|
        category = Category.find(id.to_i)
        CategoryProject.create(project: @project, category: category )
      end
    end
     if @project.save
       redirect_to project_path(@project)
     else
        render :edit
     end
  end

  def unpublish
    @project.status = 1
    if @project.save
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def projects_by_category
    @projects = Project.includes(:categories).where(categories: {title: params[:foo_param]})
  end

private

  def project_by_params_id
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :cost, :deadline, :status, :categories)
  end

end