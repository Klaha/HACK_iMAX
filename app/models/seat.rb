class Seat < ActiveRecord::Base
  has_many :seat_shows
  has_many :shows, through: :seat_shows
end