class Phase < ActiveRecord::Base

	has_many	:steps
	has_many	:activities
	has_many	:questions
	has_many 	:responses
	
end