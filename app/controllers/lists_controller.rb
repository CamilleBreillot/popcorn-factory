class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
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
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
