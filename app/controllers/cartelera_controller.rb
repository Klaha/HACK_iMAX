class CarteleraController < LoginController
  before_action :path_role_login, only:[:seats, :create, :view_transaction]
  before_action :require_login, only: [:seats, :create, :view_transaction]
  before_action :current_user, only: [:index, :show]

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def seats
    @show = Show.find_by(params[:id])
    @path = cartelera_buy_path
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

  def create

    if check_pay params['card']
      seats = params['seats_arr'].split
      show_id = params['show_id']
      tickets_e = seats.length - params['ticketsN'].to_i
      @show = Show.find_by(id: show_id)
      ci = params['user']['ci']
      uname = params['user']['name']

      user = @_current_user
      if user.nil?
        user = User.new
        user.ci = ci
        user.name = uname
        user.role = 'C'
        user.save
      end
      @price = Setting.take.price_ticket_type_1


      ShowTransaction.transaction do

        seats.each do |seat_id|
          if SeatShow.where(id:seat_id,show_id: @show.movie_id ).length==0
          else
            redirect_to new_employee_transaction_path ,notice: 'Error en los Asientos.'
            return
          end
        end

        @transactions = ShowTransaction.new
        @transactions.user_id = user.id
        @transactions.show_id = show_id
        @transactions.datetime_transaction = DateTime.now
        @transactions.status = 'paid'
        @transactions.payment_method=params['payment_method']
        @transactions.save

        #ARREGLO DE IDS DE ASIENTOS
        seats.each do |seat_id|
          ss = SeatShow.new
          ss.seat_id = seat_id
          ss.show_id = show_id
          ss.status = 'busy'

          ticket = Ticket.new
          ticket.show_transaction_id = @transactions.id
          if tickets_e>0
            # E DE dEscuento xD
            tickets_e-=1
            ticket.price = @price*0.5
            ticket.type_ticket = 'E'
          else
            ticket.price = @price
            ticket.type_ticket = 'N'
          end

          ticket.save

          ss.ticket_id = ticket.id
          ss.save


          # ss.ticket_id = ticket.id
        end
      end

      if @transactions.valid?
        redirect_to buy_info_path @transactions.id
        return
      else

      end
    else
      redirect_to cartelera_seats_path(params['show_id']), notice: 'Datos invalidos de Tarjeta'

    end
  end


  def view_transaction
    @transactions = ShowTransaction.find_by(id: params[:transaction_id]);
    if @transactions.user.id != @_current_user.id
      redirect_to root_path, notice: 'Compra no autorizada para ver'
    end
  end

  private
  def check_pay params
    return true
  end

  def path_role_login
    @path ||= login_path
    @role = "C"
  end


end
