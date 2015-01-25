class Show < ActiveRecord::Base
  has_many :show_transactions
  belongs_to :theater
  belongs_to :movie
  has_many :seats, through: :seat_shows
  validates :movie_id, presence: true
  validates :time, presence: true
  validates :theater_id, presence: true
  validates :date_show, presence: true
end
