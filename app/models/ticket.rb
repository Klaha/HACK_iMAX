class Ticket < ActiveRecord::Base
  has_one :seat_show
  belongs_to :transaction
end