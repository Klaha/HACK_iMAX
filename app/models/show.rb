class Show < ActiveRecord::Base
  has_many :theater
  has_many :movie
end
