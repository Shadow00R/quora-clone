class Answer < ActiveRecord::Base

	belongs_to :user
	belongs_to :question
	has_many :answer_votes, dependent: :destroy

	validates_presence_of :text, message: "Field Cannot Be Blank"
end