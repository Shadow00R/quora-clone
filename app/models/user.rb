require 'bcrypt'

class User < ActiveRecord::Base

	has_many :questions
	has_many :answers
	has_many :question_votes
	has_many :answer_votes

	has_secure_password

	validates_presence_of :username, message: "We Need A Username"
	validates_presence_of :email, message: "We Need An Email"
	validates_format_of :email, {with:  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/ , message: "Invalid Email. We Need A Valid Email"}
	validates_presence_of :password, message: "We Need A Password"

	def self.authenticate(email, password)
		@user = User.find_by(email: email)

		if @user && @user.authenticate(password)
			@user
		else
			return false
		end
	end
end