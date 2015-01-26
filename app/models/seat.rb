class Seat < ActiveRecord::Base
  has_many :shows, through: :seat_shows
end