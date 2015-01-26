class Employee::ShowTransactionsController < LoginController
  # before_action :set_show, only: [:show, :edit, :update, :destroy]
  before_action :set_function_theater


  def index
    @transactions = ShowTransaction.all
  end

  def show
  end

  def new
    @path = new_employee_transaction_path
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
  def set_function_theater
    if params[:theater].nil? == false

      @theater = Theater.find_by(id: params[:theater][:id])
    end

  end


  # # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transactions = ShowTransaction.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def transaction_params
    # movie_id
    # time
    # date_show
    params.require(:show_transactions).permit(:show_id, :user, :seat)
  end

end
