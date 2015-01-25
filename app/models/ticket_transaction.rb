class Ticket_transaction < ActiveRecord::Base
  has_one :seat_show
  belongs_to :transaction
end