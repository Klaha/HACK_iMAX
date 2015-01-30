class Ticket < ActiveRecord::Base
  has_one :seat_show
  belongs_to :show_transaction
  validates :type_ticket, presence: true, inclusion: {in: %w(N E),
                                               message: "%{value} is no a valid choise (N or E)"}

end