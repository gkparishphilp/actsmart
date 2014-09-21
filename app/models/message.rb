class Message < ActiveRecord::Base

	enum status: { 'unread' => 1, 'read' => 2, 'archive' => 3, 'trash' => 4  }

	belongs_to	:from, class_name: 'User'
	belongs_to 	:agency
	belongs_to	:parent_obj, polymorphic: true
	
end