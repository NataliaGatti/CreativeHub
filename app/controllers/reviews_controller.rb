class ReviewsController < ApplicationController
  # def new_company_comment_to_designer
    
  # end

  # def new_designer_comment_to_company
    
  # end

  def new
    @review = Review.new
    @project = Project.find(params[:project_id]) 
    @postulation = Postulation.find(params[:postulation_id])
  end

  def create
    @review = Review.new(reviews_params)
    @review.user = current_user
    @postulation = Postulation.find(params[:postulation_id])
    @review.postulation = @postulation
    @project = Project.find(params[:project_id])
    if @review.save
      redirect_to my_projects_path
    else
      render :new
    end
  end
  
  private

  def reviews_params
    params.require(:review).permit(:comment, :rating)
  end

end
