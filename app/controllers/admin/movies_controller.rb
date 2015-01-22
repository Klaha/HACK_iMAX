class Admin::MoviesController < ApplicationController
  before_action :get_movies, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all
  end

  def show
  end

  def new
    @movie = Movie.new
    @path = admin_movies_path
  end

	def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to admin_movie_path @movie
    end

	end

  def edit
    @path = admin_movie_path
  end

  def update
    if @movie.update_attributes(movie_params)
      redirect_to admin_movie_path
    end 
  end

  def destroy
    @movie.destroy
    redirect_to admin_movies_path
  end

  private

  def get_movies
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:name, :sinopsis, :duration, :image)
  end
end