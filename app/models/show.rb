class Show < ActiveRecord::Base
  has_many :transactions
  belongs_to :theater
  belongs_to :movie
end
