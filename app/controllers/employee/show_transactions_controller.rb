class Employee::ShowTransactionsController < LoginController
  # before_action :set_show, only: [:show, :edit, :update, :destroy]
  before_action :set_show, only: [:seats, :client, :create, :show, :new_seats]


  def index
    @transactions = ShowTransaction.all
  end

  def show
  end

  def new
    @path = employee_transactions_new_seats_path
  end

  def new_seats
    @path = employee_transactions_path
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
    seats = params['seats_arr'].split
    show_id = params['show_id']
    tickets_e = seats.length - params['ticketsN'].to_i

    ci = params['user']['ci']
    uname = params['user']['name']

    user = User.find_by(ci: ci)
    if user.nil?
      user = User.new
      user.ci = ci
      user.name = uname
      user.role = 'C'
      user.save
    end
    @price = Setting.take.price_ticket_type_1
    seats.each do |seat_id|
      if SeatShow.where(id:seat_id,show_id: @show.movie_id ).length==0
      else
        redirect_to new_employee_transaction_path ,notice: 'Error en los Asientos.'
        return
      end
    end
    ShowTransaction.transaction do

      @transactions = ShowTransaction.new
      @transactions.user_id = user.id
      @transactions.show_id = show_id
      @transactions.datetime_transaction = DateTime.now
      @transactions.status = "paid"
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
      redirect_to employee_transactions_path
    else

    end
  end


  private
  def set_show
    if params[:show_id].nil?
      redirect_to new_employee_transaction_path
    else
      @show= Show.find(params[:show_id])
    end
  end

  # # Use callbacks to share common setup or constraints between actions.
  # def set_transaction
  #   @transactions = ShowTransaction.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  # def transaction_params
  #   # movie_id
  #   # time
  #   # date_show
  #   params.require(:show_transactions).permit(:show_id, :seats, :user)
  # end

end
