class MoviesController < ApplicationController
  before_action :set_movie, only: [:edit, :set_movie]
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new

  end

  def create

  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)

    if @movie.update(movie_params)
      redirect_to movie_path(@movie)
    else
      render :new, status: 422
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to @movie
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url, :id)
  end

def set_movie
  @movie = Movie.find(params[:id])
end

end
