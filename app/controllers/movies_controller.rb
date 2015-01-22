class MoviesController < ApplicationController
  before_action :get_movies, only: [:show, :edit, :update]

  def index
    @movies = Movie.all
  end

  def show
  end

  def edit
  end

  def update
    if @movie.update_attributes(movie_params)
      redirect_to @movie
    end 
  end

  def new
    @movie = Movie.new
  end

	def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to @movie
    end

	end

  private

  def get_movies
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:name, :sinopsis, :duration, :image)
  end
end