class Movie < ActiveRecord::Base
  has_many :shows
  validates :name, presence: true
  validates :sinopsis, presence: true
  validates :duration, presence: true
end