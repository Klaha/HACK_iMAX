class Employee::ShowsController < LoginController
  before_action :path_role_login
  before_action :require_login
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
    # nil.length
    @show = Show.new({movie_id: params[:movie_id] , theater_id: params[:theater_id]})
    count = Show.where(date_show: Date.today, theater_id: params[:theater_idgi]).length
    if count==0
      @show.time= (Time.now.midday+2*3600).utc
    else
      if count<5
        @show.time= (Time.now.midday+(count+1)*2*3600).utc
      else
        respond_to do |format|
          format.html {
            redirect_to employee_shows_path,
                                           notice: 'no es posible incluir mas funciones en esta sala el dia de hoy.'
          }
        end
        return
      end
    end
    # if can_use_theater
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

    # else
    #   #TEATRO OCUPADO 
    #   respond_to do |format|
    #     @ocupado = true
    #     new
    #     format.html { render :new }
    #     format.json { render json: @show.errors, status: :unprocessable_entity }
    #   end
    # end

  end

  def destroy
    if @show.show_transactions.length==0
      @show.destroy
      redirect_to employee_shows_path
    else
      redirect_to employee_shows_path, notice: 'Ya hay boletos vendidos para esta función'
    end

  end

  def edit
    @path = employee_show_path
  end

  def update
    respond_to do |format|
      if @show.update({movie_id: params[:movie_id] , theater_id: params[:theater_id]})
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

  def path_role_login
    @path ||= login_path
    @role = "E"
  end

  # Never trust parameters from the scary internet, only allow the white list through.


  # def can_use_theater
  #   start_time = @show.time.hour * 3600 + @show.time.min * 60
  #   ending_time = start_time + @show.movie.duration.hour * 3600 + @show.movie.duration.min * 60
  #   theater = Theater.find_by id: @show.theater_id
  #
  #   theater.shows.each do |s|
  #     start_time_2 = s.time.hour * 3600 + s.time.min * 60
  #     # SE SUMAN 30 MINUTOS al final de la duracion de las peliculas ya en el sistema para los
  #     #30 minutos de limpieza
  #     ending_time_2 = start_time_2 + s.movie.duration.hour * 3600 + (s.movie.duration.min + 30) * 60
  #
  #     # BLOQUE DE Tiempo 1 show que se quiere ingresar (start_time , ending_time)
  #     # BLOQUE DE Tiempo 2 show que se tiene en el sistema cargado (start_time_2 , ending_time_2)
  #
  #     if start_time > ending_time_2
  #       #ok
  #     else
  #       if start_time_2 > ending_time
  #         #ok
  #       else
  #         return false
  #       end
  #     end
  #   end
  #   return true
  # end

end
