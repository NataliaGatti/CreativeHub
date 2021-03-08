class FavouriteProjectsController < ApplicationController

 def index_by_user
  @user = current_user
  @favourites = @user.favourite_projects
 end

  def create
    @favourite_project = FavouriteProject.new(
      user: current_user,
      project: Project.find(params[:project_id])
    )
    if @favourite_project.save
      flash[:alert] = "Se ha añadido el proyecto a tus favoritos"
       redirect_to projects_path 
    else
      flash[:alert] = "Falta información en tu postulación"
    end
  end

def destroy
  @favourite_project = FavouriteProject.find(params[:id])
  @favourite_project.destroy
  flash[:alert] = "Has quitado el proyecto de tu lista de favoritos"
  redirect_to projects_path 
end


end 