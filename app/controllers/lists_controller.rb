class ListsController < ApplicationController

  def index
    @lists = policy_scope(List)
    @lists = List.where(user: current_user)
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @movies = Movie.all.limit(10)
    if params[:query].present?
      @movies = @movies.where('title ILIKE ?', "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'lists/movie-list', locals: { movies: @movies }, formats: [:html] }
    end
    authorize @list
  end

  def new
    @list = List.new
    authorize @list
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    @list.status = false
    if @list.save
      redirect_to list_path(@list)
    else
      render "lists/index"
    end
    authorize @list
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
