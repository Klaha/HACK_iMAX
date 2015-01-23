class Show < ActiveRecord::Base
  has_many :theaters
  belongs_to :movie
end
