class ShowTransaction < ActiveRecord::Base
  has_many :tickets
  belongs_to :show
  belongs_to :user
  validates :status, inclusion: { in: %w(reserved paid),
                                  message: "%{value} is not a valid size" }
  def total_transaction
    result = 0
    self.tickets.each do |t|
      result+=t.price
    end
    return result
  end

end