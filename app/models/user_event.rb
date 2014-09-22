class UserEvent < ActiveRecord::Base

	enum status: { 'active' => 1, 'archive' => 2, 'trash' => 3 }

	belongs_to 		:user
	belongs_to		:agency
	belongs_to		:parent_obj, polymorphic: true

	### Class Methods   	--------------------------------------

	def self.by_object( obj )
		return scoped if obj.nil?
		where( parent_obj_type: obj.class.name, parent_obj_id: obj.id )
	end

	def self.dated_between( start_date=1.month.ago, end_date=1.month.from_now )
		where( "created_at between ? and ?", start_date, end_date )
	end

	def self.recent( num=10 )
		order( 'created_at desc' ).limit( num )
	end

	
	def self.record( name, args={} )
		return false unless name = name.to_s
		user_id = args[:user].try( :id )
		agency_id = args[:agency].try( :id ) || args[:user].try( :agency )
		parent_obj = args[:on] || args[:obj] || args[:parent_obj]


		rate = args[:rate] || 5.minutes

		# setting owner_type so logging with nill owner doesn't populate owner_type with NilClass
		parent_obj_type = parent_obj.nil? ? nil : parent_obj.class.name

		dup_events = self.where( name: name, user_id: user_id ).within_last( rate )
		dup_events = dup_events.by_object( parent_obj ) if parent_obj.present?
		# DO NOT record if existing events within rate
		return false if dup_events.count > 0
		
		event = self.create( 	name: name, 
								user_id: user_id, 
								agency_id: agency_id,
								parent_obj: parent_obj,
								value: args[:value],
								content: args[:content]
							)

		return event

	end


	def self.within_last( period=1.minute )
		period_ago = Time.zone.now - period
		where( "created_at >= ?", period_ago )
	end


end