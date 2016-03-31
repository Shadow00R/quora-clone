class Question < ActiveRecord::Base

	belongs_to :user
	has_many :answers, dependent: :destroy
	has_many :question_votes, dependent: :destroy

	validates_presence_of :title, message: "Title Cannot Be Blank"
	validates_presence_of :body, message: "Content Cannot Be Blank"

end