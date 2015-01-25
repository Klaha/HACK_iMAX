class User < ActiveRecord::Base
	has_many :transactions

	def self.authenticate (params)
		u = User.where("email = ? AND password = ?",params[:email],params[:password])

			if u.take.nil?
			return false
		else
			return u.take
		end

	end
end
