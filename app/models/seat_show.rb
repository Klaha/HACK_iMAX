class Seat_show < ActiveRecord::Base
  belongs_to :seat
  belongs_to :show
  belongs_to :ticket
end