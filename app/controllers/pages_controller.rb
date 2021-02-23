class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home]

  def home
    @categories = Category.all
    @projects = Project.all.first(3)
    @designers = User.designers.first(4)
  end
end
