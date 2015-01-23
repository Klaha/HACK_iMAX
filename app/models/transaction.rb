class Transaction < ActiveRecord::Base
	has_many :tickets
	belongs_to :show
end
