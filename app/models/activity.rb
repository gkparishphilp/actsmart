class Activity < ActiveRecord::Base

	belongs_to 	:phase
	belongs_to  :activity

	has_many	:questions

end