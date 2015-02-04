class CarteleraController < LoginController
  before_action :path_role_login, only:[:seats]
  before_action :require_login, only: [:seats]
  before_action :current_user, only: [:index, :show]

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def seats
    @show = Show.find_by(params[:id])
    @path = employee_transactions_path
    # @path_redirect = [(cartelera_show_path+'?'+@show.id), ]
    @theater = @show.theater
    @seats_hash = {}
    @price = Setting.take.price_ticket_type_1
    seatshows = SeatShow.where(show_id: @show.id)

    if seatshows.nil?!=true
      seatshows.each do |ss|
        # [[i,j],status]
        @seats_hash[ss.seat.id] = [ [ss.seat.row,ss.seat.col] , ss.status]
      end
    end
  end

  private

  def path_role_login
    @path ||= login_path
    @role = "C"
  end


end
