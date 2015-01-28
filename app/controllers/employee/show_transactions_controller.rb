class Employee::ShowTransactionsController < LoginController
  # before_action :set_show, only: [:show, :edit, :update, :destroy]
  before_action :set_show, only: [:seats, :client, :edit, :update, :destroy, :show, :new_seats]


  def index
    @transactions = ShowTransaction.all
  end

  def show
  end

  def new
    @path = employee_transactions_new_seats_path
  end

  def new_seats
    @path = employee_transactions_new_seats_client_path
    @theater = @show.theater
    @seats_hash = {}
    seatshows = SeatShow.find_by(show_id: @show.id)

    if seatshows.nil?!=true
      seatshows.each do |ss|
        @seats_hash[ss.seat.id] = [ [ss.seat.row,ss.seat.col] , ss.status]
      end
    end

  end

  def new_seats_client
    nil.length
  end

  def create

    @transactions = ShowTransaction.new(transaction_params)
    @transactions.date_transaction = Date.today
    respond_to do |format|
      if @transactions.save
        format.html { redirect_to employee_show_path @show.id, notice: 'Show was successfully created.' }
        format.json { render :show, status: :created, location: @show }
      else
        format.html { render :new }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @transactions.destroy
    redirect_to employee_transactions_path
  end

  def edit
    @path = employee_transaction_path
  end

  def update
    respond_to do |format|
      if @transactions.update(show_params)
        format.html { redirect_to employee_transactions_path, notice: 'Transaction was successfully updated.' }
      else
        format.html { render :edit }
      end
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
