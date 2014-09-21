class Question < ActiveRecord::Base

	# validates :name, uniqueness: true

	belongs_to :activity

	has_many	:prompts
	has_many	:responses
	
end