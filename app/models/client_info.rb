class ClientInfo < ActiveRecord::Base
  belongs_to :show_transaction
  validates :name, presence: true
  validates :ci, presence: true
end
