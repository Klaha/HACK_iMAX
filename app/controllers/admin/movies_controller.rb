class Admin::MoviesController < LoginController
  before_action :path_role_login
  before_action :get_movies, only: [:show, :edit, :update, :destroy]
  before_action :show_all_movies, only: [:index]
  before_action :require_login

  def index
  end

  def show
  end

  def new
    @movie = Movie.new
    @path = admin_movies_path
  end

	def create
    @movie = Movie.new(movie_params)
    @movie.duration = Time.now.midday+1*3600+30*60
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
    if @movie.shows.length==0
      @movie.destroy
      redirect_to admin_movies_path
    else
      redirect_to admin_movies_path, notice: 'Esta Pelicula tiene Funciones Cargadas!'

    end
  end

  private

  def get_movies
    @movie = Movie.find(params[:id])
  end

  def show_all_movies
    @movies = Movie.all
  end

  def movie_params
    params.require(:movie).permit(:name, :sinopsis, :image)
  end

  def path_role_login
    @path ||= login_path
    @role = "A"
  end

end