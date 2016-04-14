require "bcrypt"

class User < ActiveRecord::Base
	has_many :review

	validates :password,
		presence: true,
		on: :create,
		length: {
			minimum: 10
		}

	validates :email,
		presence: true,
		uniqueness: {:case_sensitive => false}

	has_secure_password

	def self.authenticate(email, password)
		User.find_by_email(email).try(:authenticate, password)
	end
end
