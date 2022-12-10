class ListsController < ApplicationController
  # before_action :set_list
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all

  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
    @movies = Movie.all

  end

  def edit
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_params)

    if @list.save
      params[:list][:movie_ids].each do |movie_id|
        next unless movie_id.present?
        Bookmark.create!(movie_id: movie_id.to_i, list: @list)

      end

      redirect_to list_path(@list)

    else
      render :new, status: :unprocessable_entity
    end


  end

  def update

    if @list.update(list_params)
      redirect_to list_path(@list)
    else
      render :new, status: 422
    end
  end


  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to @list
  end


  private


  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :poster_url)
  end

end
