class ReviewsController < ApplicationController

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @list = List.find(params[:list_id])
    @review.list = @list
    authorize @review
    if @review.save
      redirect_to list_path(@list)
    else
      flash[:alert] = "Something went wrong."
      render "lists/show"
    end
  end

  private

    def review_params
      params.require(:review).permit(:comment, :rating)
    end
end
