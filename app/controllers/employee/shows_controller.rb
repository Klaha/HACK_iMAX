class Employee::ShowsController < ApplicationController
  before_action :set_show, only: [:show, :edit, :update, :destroy]
  def index
    @shows = Show.all
  end

  def new
    @show = Show.new
    @movies = Movie.all
    @path = employee_shows_path
  end

  def show
  end

  def create
    @show = Show.new(show_params)
    @show.date_show = Date.today
    respond_to do |format|
      if @show.save
        format.html { redirect_to employee_show_path @show.id, notice: 'Show was successfully created.' }
        format.json { render :show, status: :created, location: @show }
      else
        format.html { render :new }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @show.destroy
    redirect_to employee_shows_path
  end

  def edit
    @path = employee_show_path
  end

  def update 
    respond_to do |format|
      if @show.update(show_params)
        format.html { redirect_to employee_shows_path, notice: 'Show was successfully updated.' }
        format.json { render :show, status: :ok, location: @show }
      else
        format.html { render :edit }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # # Use callbacks to share common setup or constraints between actions.
    def set_show
      @show = Show.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def show_params
      # movie_id
      # time
      # date_show
      params.require(:show).permit(:movie_id,:time)
    end

end
