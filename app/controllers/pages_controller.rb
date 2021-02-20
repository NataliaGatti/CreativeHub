class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home]

  def home
    @categories = Category.all
    @projects = Project.last(6)
  end
end
