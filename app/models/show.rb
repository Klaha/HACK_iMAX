class Show < ActiveRecord::Base
  has_many :theaters
  has_many :transactions
  belongs_to :movie
end
