class Step < ActiveRecord::Base
	
	belongs_to :phase

	has_many	:activities
	has_many	:questions
	has_many 	:responses
	
end