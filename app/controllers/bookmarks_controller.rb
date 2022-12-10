class BookmarksController < ApplicationController
  before_action :set_list_id
  before_action :set_bookmark_id, only: [:edit, :update, :show, :destroy]

  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
    @bookmark.list_id = @list
    @bookmark.movie_id = @movie.id
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: 422
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark)

  end

  private

    def bookmark_params
      params.require(:bookmark).permit(:comment, :movie_id, :list_id)
    end

    def set_list_id
      @list = List.find(params[:list_id])
    end

    def set_bookmark_id
      @bookmark = Bookmark.find(params[:id])
    end

end
