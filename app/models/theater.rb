class Theater < ActiveRecord::Base
  has_many :shows
  validates :theater_number, presence: true, numericality: true
  validates :type_theater, presence: true, inclusion: { in: %w(N P), message: "Tipos de teatros permitidos: \"N\" (normal), \"P\" (Premium)" }
end
