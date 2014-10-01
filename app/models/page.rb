
class Page < ActiveRecord::Base

	enum status: { 'active' => 1, 'archived' => 2, 'deleted' => 3 }
	
	include FriendlyId
	friendly_id :title, use: :slugged

end