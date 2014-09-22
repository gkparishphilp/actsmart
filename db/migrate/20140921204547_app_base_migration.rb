class AppBaseMigration < ActiveRecord::Migration
	def change

		create_table :activities do |t|
			t.references		:phase
			t.references		:step
			t.string			:name
			t.string			:label
			t.integer			:seq
			t.string			:activity_type
			t.text				:content
			t.timestamps
		end
		add_index :activities, :phase_id
		add_index :activities, :step_id
		add_index :activities, :seq
		add_index :activities, [ :phase_id, :step_id ]


		create_table :agencies do |t|
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
		add_index :agencies, :facilitator_id


		create_table :agency_users do |t|
			t.references	:agency
			t.references 	:user
			t.string		:role, default: :member
			t.timestamps
		end
		add_index :agency_users, :agency_id
		add_index :agency_users, :user_id
		add_index :agency_users, [ :agency_id, :user_id ]


		create_table :messages do |t|
			t.references 	:from
			t.references	:agency
			t.references	:parent_obj, polymorphic: true
			t.string		:context
			t.string		:subject
			t.text			:content
			t.integer		:status, 	default: 1
			t.boolean		:read, 		default: false
			t.datetime		:read_at
			t.timestamps
		end
		add_index :messages, :from_id
		add_index :messages, :agency_id
		add_index :messages, [ :parent_obj_id, :parent_obj_type ]


		create_table :phases do |t|
			t.string 			:name
			t.string			:label
			t.integer 			:seq
			t.timestamps
		end
		add_index :phases, :seq


		create_table :prompts do |t|
			t.references	:question
			t.string		:prompt_type, default: 'radio'
			t.text			:content
			t.integer 		:seq
			t.integer		:value
			t.boolean		:correct
			t.timestamps
		end


		create_table :questions do |t|
			t.references	:activity
			t.references	:step
			t.references	:phase
			t.string 		:name
			t.text			:content
			t.string		:question_type
			t.string		:section
			t.integer		:seq
			t.timestamps
		end
		add_index :questions, :step_id
		add_index :questions, :phase_id
		add_index :questions, :seq
		add_index :questions, :activity_id
		add_index :questions, :name


		create_table :responses do |t|
			t.references 	:user
			t.references	:agency
			t.references 	:question
			t.references	:activity
			t.references	:step
			t.references 	:phase
			t.references 	:prompt
			t.text			:content     # in the case of free-response
			t.datetime		:started_at
			t.datetime		:responded_at
			t.timestamps
		end
		add_index :responses, :user_id
		add_index :responses, :agency_id
		add_index :responses, :activity_id
		add_index :responses, :step_id
		add_index :responses, :phase_id
		add_index :responses, :question_id
		add_index :responses, :prompt_id


		create_table :steps do |t|
			t.references 	:phase
			t.string		:name
			t.string		:label
			t.integer 		:seq
			t.timestamps
		end
		add_index :steps, :phase_id
		add_index :steps, :seq


	end
end
