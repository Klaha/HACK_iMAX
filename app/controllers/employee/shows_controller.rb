class Employee::ShowsController < ApplicationController
  before_action :set_show, only: [:show, :edit, :update, :destroy]
  
  def index
    @shows = Show.all
  end

  def show
  end

  def new
    @show = Show.new
    @path = employee_shows_path
  end

  def create
    @show = Show.new(show_params)
    if can_use_theater
      # TEATRO NO OCUPADO
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

    else
      #TEATRO OCUPADO 
      respond_to do |format|
        @ocupado = true
        new
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
      else
        format.html { render :edit }
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
      params.require(:show).permit(:movie_id,:time,:theater_id)
    end

    def can_use_theater
      start_time = @show.time.hour * 3600 + @show.time.min * 60
      ending_time = start_time + @show.movie.duration.hour * 3600 + @show.movie.duration.min * 60
      theater = Theater.find_by id: @show.theater_id

      theater.shows.each do |s|
        start_time_2 = s.time.hour * 3600 + s.time.min * 60
        ending_time_2 = start_time_2 + s.movie.duration.hour * 3600 + (s.movie.duration.min + 30) * 60
        
        # BLOQUE DE Tiempo 1 show que se quiere ingresar (start_time , ending_time)
        # BLOQUE DE Tiempo 2 show que se tiene en el sistema cargado (start_time_2 , ending_time_2)

        if start_time > ending_time_2 
          #ok
        else 
          if start_time_2 > ending_time
            #ok
          else
            return false
          end
        end
      end
      return true
    end

end
