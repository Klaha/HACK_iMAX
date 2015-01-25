class User < ActiveRecord::Base
	has_many :transactions
	
	validates :name, presence: true
	validates :ci, presence: true
	validates :email, presence: true
	validates :password, presence: true
	validates :role, presence: true

	def self.authenticate (params)
		u = User.where("email = ? AND password = ?",params[:email],params[:password])

			if u.take.nil?
			return false
		else
			return u.take
		end

	end
end
