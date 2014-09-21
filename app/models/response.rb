class Response < ActiveRecord::Base

	belongs_to	:user
	belongs_to	:agency
	belongs_to	:question
	belongs_to	:prompt

end