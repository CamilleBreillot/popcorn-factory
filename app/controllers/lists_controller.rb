class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [ :show ]

  def index
    @lists = policy_scope(List)
    @list = List.new
  end

  def show
    @bookmark = Bookmark.new
    @review = Review.new
    @movies = Movie.all.limit(10)
    if params[:query].present?
      @movies = @movies.where('title ILIKE ?', "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'lists/movie-list', locals: { movies: @movies }, formats: [:html] }
    end
  end

  def new
    @list = List.new
    authorize @list
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    @list.status = false
    authorize @list
    if @list.save
      redirect_to list_path(@list)
    else
      render "lists/index"
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private

    def list_params
      params.require(:list).permit(:name, :photo)
    end

    def set_list
      @list = List.find(params[:id])
      authorize @list
    end
end
