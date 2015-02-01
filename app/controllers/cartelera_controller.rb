class CarteleraController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def seats
    @path = employee_transactions_path
    # @movie = Movie.find(params[:movie_id])
    @show = Show.find(params[:id])
    @theater = @show.theater_id
    @movie = @show.movie_id
    # @theater = Theater.find(params[:theater_id])
    @seats_hash = {}
    @price = Setting.take.price_ticket_type_1
    seatshows = SeatShow.where(show_id: @show.id)

    if seatshows.nil?!=true
      seatshows.each do |ss|
        @seats_hash[ss.seat.id] = [ [ss.seat.row,ss.seat.col] , ss.status]
      end
    end
  end

end
