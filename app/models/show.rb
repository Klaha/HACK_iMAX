class Show < ActiveRecord::Base
  has_many :transactions
  belongs_to :theater
  belongs_to :movie
  validates :movie_id, presence: true
  validates :time, presence: true
  validates :theater_id, presence: true
  validates :date_show, presence: true
end
