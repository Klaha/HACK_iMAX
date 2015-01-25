class ShowTransaction < ActiveRecord::Base
  has_many :tickets
end