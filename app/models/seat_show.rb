class SeatShow < ActiveRecord::Base
  belongs_to :seat
  belongs_to :show
  belongs_to :show_transaction
end