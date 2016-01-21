class User < ActiveRecord::Base
	has_secure_password
	before_save :lowercase_email 

	has_many :assignments 
	has_many :inventories, through: :assignments

	validates :email, presence: true, uniqueness: true, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/}
	validates :name, presence: true
	validates :password, presence: true



	def lowercase_email
		self.email = email.downcase 
	end 

end
