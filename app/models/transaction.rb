class Transaction < ActiveRecord::Base
  has_many :tickets
end