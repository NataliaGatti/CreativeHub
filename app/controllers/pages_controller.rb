class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home]

  def home
    @categories = Category.all
    @projects = [
      Project.new(
        title: "price waterhouse compay",
        description: "started up with a kis how did it end like this it was only a kiss it was only a kiss",
        cost: 123.0,
        deadline: DateTime.now,
        status: 1,
        user_id: 1,
      ),
      Project.new(
        title: "price waterhouse compay",
        description: "started up with a kis how did it end like this it was only a kiss it was only a kiss",
        cost: 123.0,
        deadline: DateTime.now,
        status: 1,
        user_id: 1,
      ),
      Project.new(
        title: "price waterhouse compay",
        description: "started up with a kis how did it end like this it was only a kiss it was only a kiss",
        cost: 123.0,
        deadline: DateTime.now,
        status: 1,
        user_id: 1,
      )
    ]
  end
end
