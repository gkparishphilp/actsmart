class Responding < ActiveRecord::Base

	enum status: { 'active' => 1, 'complete' => 2 }

	belongs_to :activity
	belongs_to :agency

end