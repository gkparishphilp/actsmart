class Message < ActiveRecord::Base

	belongs_to	:from, class_name: 'User'
	belongs_to 	:agency
	belongs_to	:parent_obj, polymorphic: true
	
end