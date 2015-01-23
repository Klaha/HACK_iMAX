class Employee::TransactionsController < ApplicationController
  before_action :set_show, only: [:show, :edit, :update, :destroy]
  
  def index
    @transaction = Transaction.all
  end

  def show
  end

  def new
    @transaction = Transaction.new
    @path = employee_transactions_path
  end

  def create

    @transaction = Transaction.new(transaction_params)
    @transaction.date_transaction = Date.today
    respond_to do |format|
      if @transaction.save
        format.html { redirect_to employee_show_path @show.id, notice: 'Show was successfully created.' }
        format.json { render :show, status: :created, location: @show }
      else
        format.html { render :new }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @transaction.destroy
    redirect_to employee_transactions_path
  end

  def edit
    @path = employee_transaction_path
  end

  def update 
    respond_to do |format|
      if @transaction.update(show_params)
        format.html { redirect_to employee_transactions_path, notice: 'Transaction was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    # # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      # movie_id
      # time
      # date_show
      params.require(:transaction).permit(:movie_id,:time)
    end

end
