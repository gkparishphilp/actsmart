class V1Migration < ActiveRecord::Migration
	def change

		create_table :agencies do |t|
			t.references	:lead
			t.references	:facilitator
			t.string		:name
			t.text			:description
			t.text			:notes
			t.string		:address1
			t.string		:address2
			t.string		:city
			t.string		:state 
			t.string		:zip 
			t.string		:phone
			t.integer		:status, 	default: 1
			t.timestamps
		end
		add_index :agencies, :lead_id


		create_table :agency_users do |t|
			t.references	:agency
			t.references 	:user
			t.string		:role
			t.timestamps
		end
		add_index :agency_users, :agency_id
		add_index :agency_users, :user_id
		add_index :agency_users, [ :agency_id, :user_id ]


		create_table :contacts do |t|
			t.string		:email
			t.string		:subject
			t.text			:message
			t.string		:ip
			t.string		:contact_type
			t.string		:http_referrer
			t.string		:status, default: :active 
			t.timestamps
		end
		add_index :contacts, :email


		create_table :messages do |t|
			t.references 	:from
			t.references	:agency
			t.references	:parent_obj, polymorphic: true
			t.string		:context
			t.string		:subject
			t.text			:content
			t.integer		:status, 	default: 0
			t.boolean		:read, 		default: false
			t.datetime		:read_at
			t.timestamps
		end
		add_index :messages, :from_id
		add_index :messages, :agency_id
		add_index :messages, [ :parent_obj_id, :parent_obj_type ]


		create_table :users do |t|
			t.string		:name
			t.string 		:slug
			t.string 		:first_name
			t.string 		:last_name
			t.integer		:role, default: 0
			t.string 		:avatar
			t.datetime 		:dob
			t.string		:gender
			t.string		:address1
			t.string		:address2
			t.string		:city
			t.string		:state 
			t.string		:zip 
			t.string		:phone
			t.string		:status,				default: 1
			t.string 		:website_url
			t.text 			:bio
			t.text 			:sig
			t.string		:ip
			t.float			:latitude
			t.float 		:longitude

			## Database authenticatable
			t.string		:email,					null: false, default: ""
			t.string		:encrypted_password,	null: false, default: ""

			## Recoverable
			t.string		:reset_password_token
			t.datetime		:reset_password_sent_at

			t.string		:password_hint
			t.string		:password_hint_response

			## Rememberable
			t.datetime		:remember_created_at

			## Trackable
			t.integer		:sign_in_count, :default => 0
			t.datetime		:current_sign_in_at
			t.datetime		:last_sign_in_at
			t.string		:current_sign_in_ip
			t.string		:last_sign_in_ip

			## Confirmable
			t.string		:confirmation_token
			t.datetime		:confirmed_at
			t.datetime		:confirmation_sent_at
			t.string		:unconfirmed_email # Only if using reconfirmable

			## Lockable
			t.integer		:failed_attempts, 		default: 0 # Only if lock strategy is :failed_attempts
			t.string		:unlock_token # Only if unlock strategy is :email or :both
			t.datetime		:locked_at

			## Token authenticatable
			t.string		:authentication_token

			t.timestamps
		end

		add_index :users, :name,					unique: true
		add_index :users, :slug, 					unique: true
		add_index :users, :email, 					unique: true
		add_index :users, :reset_password_token,	unique: true
		add_index :users, :confirmation_token,		unique: true
		add_index :users, :unlock_token,			unique: true
		add_index :users, :authentication_token,	unique: true


		create_table :user_events do |t|
			t.references		:user
			t.references		:agency
			t.references 		:parent_obj, 			polymorphic: true
			t.string			:name
			t.text				:content
			t.integer			:value
			t.string			:http_referrer
			t.string			:req_path
			t.integer			:status, 						default: 0
			t.datetime			:publish_at
			t.timestamps
		end
		add_index :user_events, :user_id
		add_index :user_events, :agency_id
		add_index :user_events, [ :parent_obj_id, :parent_obj_type ], name: 'index_user_events_on_parent'
		add_index :user_events, :name
		add_index :user_events, [ :name, :user_id ]



	end
end
