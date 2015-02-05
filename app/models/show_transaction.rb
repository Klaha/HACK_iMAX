class ShowTransaction < ActiveRecord::Base
  has_many :tickets
  belongs_to :show
  belongs_to :user
  has_one :client_info
  validates :status, inclusion: { in: %w(reserved paid),
                                  message: "%{value} is not a valid status" }
  validates :payment_method, inclusion: {in: %w(cash credit_card check),
                                  message: "%{value} is not a valid payment method"}
  def total_transaction
    result = 0
    self.tickets.each do |t|
      result+=t.price
    end
    return result
  end

end