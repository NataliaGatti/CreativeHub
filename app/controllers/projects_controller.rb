class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
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
    @project.punch(request)
    @company = @project.user
    @reviews = []
    projects = @company.projects

    chatroom = Chatroom.all.where("project_id = ?", params[:id].to_i)
                            .where("company_id = ?", @project.user.id.to_i)
                            .where("designer_id = ?", current_user.id.to_i)
    if chatroom.length == 1
      @chatroom = chatroom[0]
      @has_chatroom = true
    else
      @has_chatroom = false
    end

    projects.each do |project|
      project.postulations.each do |postulation|
        @reviews << postulation.review if postulation.review.present? && postulation.review.user != @company
      end
    end

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
      redirect_to project_path(@project), notice: "¡Has creado correctamente el proyecto!"
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
    @projects = Project.includes(:categories).where(categories: {title: params[:param]})
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
    elsif @project.status == "Abierto" && @project.postulations.count == 0
      @project.status = :Cerrado
    end

    @project.save
    redirect_to my_projects_path
  end
  
  def my_projects_postulations
    @postulations = @project.postulations
  end

  def chat
    respond_to do |format|
      format.html {}
      format.js
    end
  end

 
  private

  def project_by_params_id
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :cost, :deadline, :status, :categories)
  end

end