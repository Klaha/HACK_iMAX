class SeatShow < ActiveRecord::Base
  belongs_to :seat
  belongs_to :show
  belongs_to :show_transaction
  validates :status, inclusion: { in: %w(busy available reserved),
                                message: "%{value} is not a valid status" }
end