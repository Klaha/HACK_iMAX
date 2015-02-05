class User < ActiveRecord::Base
	has_many :show_transactions
	
	validates :name, presence: true
	#validates :ci, presence: true
	validates :ci, uniqueness: true
	validates :email, uniqueness: true #, presence: true
	validates :password, presence: true
	validates :role, presence: true, inclusion: {in: %w(E C A),
								 message: "%{value} is no a valid choise (E, C, or A)"}

	def self.authenticate (params)
		u = User.where("email = ? AND password = ?",params[:email],params[:password])

			if u.take.nil?
			return nil
		else
			return u.take
		end

	end
end
