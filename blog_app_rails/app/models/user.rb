# require 'bcrypt'

class User < ActiveRecord::Base
	has_secure_password
	has_many :articles
	
	def self.confirm(email_param, password_param)
		user = User.find_by({email: email_param})
		user.authenticate(password_param)
	end

	def set_password_reset
	  self.code = SecureRandom.urlsafe_base64
	  self.expires_at = 4.hours.from_now
	  self.save!
	end
end
