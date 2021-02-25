class ProjectsController < ApplicationController

  before_action :project_by_params_id, only: [:show,:edit, :update, :unpublish, :unpublish_project_by_user_company, :my_projects_postulations, :change_projects_postulations_state]

  def index
    if current_user.company
      redirect_to my_projects_path
    else
      if params[:query].present?
        sql_query = "title ILIKE :query OR description ILIKE :query"
        @projects = Project.where(sql_query, query: "%#{params[:query]}%")
      else
        @projects = Project.all.open_proyects
      end
    end
  end

  def show
    if current_user.company
      redirect_to projects_path
    end
    @company = @project.user
    @reviews = @company.reviews

    @user_postulated = false
    current_user.postulations.each do |postulation|
      @user_postulated = true if postulation.project_id == params[:id].to_i
    end
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

  def index_by_user_company
    if current_user.company
      @projects = current_user.projects
    else
        redirect_to my_postulations
    end
  end


  def change_projects_postulations_state
    @postulations = @project.postulations
    @postulation_id = params[:postulation_id].to_i
    @project.status = "Cerrado"

    @postulations.each do |p|
      if p.id == @postulation_id
        p.status = "Aceptado"
      else
        p.status = "Declinado"
      end
      p.save
    end
    @project.save
    
    redirect_to my_projects_postulations_path(@project)
  end
  
  
  
  def unpublish_project_by_user_company
    if @project.status == "Cerrado"
      @project.status = :Abierto
    elsif @project.status == "Abierto" && @project.postulations == 0
      @project.status = :Cerrado
    end

    @project.save
    redirect_to my_projects_path
  end
  
  def my_projects_postulations
    @postulations = @project.postulations
  end

  private

  def project_by_params_id
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :cost, :deadline, :status, :categories)
  end

end