class Agency < ActiveRecord::Base

	enum status: { 'active' => 1, 'archive' => 2 }

	belongs_to	:facilitator, class_name: 'User'

	has_many 	:agency_users, dependent: :destroy
	has_many	:users, through: :agency_users

	has_many	:budget_items
	
	has_many	:funding_sources
	has_many	:treatment_strategies
	has_many	:treatment_adaptations
	has_many	:agency_treatments

	has_many	:messages
	has_many	:respondings
	has_many	:responses

	has_many	:tasks

	has_many	:treatments

  	after_create :create_treatment_strategies
  	after_create :create_treatment_adaptations
  	after_create :create_agency_treatments


  	def to_csv(agency)
  		CSV.generate do |csv|
  			csv << [agency.name]
			csv << ['Phase', 'Step', 'Activity', 'Question Number', 'Response']
			agency.responses.order("phase_id ASC", "question_id ASC").each do |response|
				csv << [response.phase_id, response.step_id, response.activity_id, response.question_id, response.content]
			end

			csv << ['Funding Source', 'Offer Funding?', 'Reimbursement Rate']
			agency.funding_sources.order("id ASC").each do |funding_source|
				csv << [funding_source.name, funding_source.offer_funding, funding_source.reimbursement_rate]
			end

			csv << ['Treatment Adaptation', 'Reasons for Adaptation', 'Specific Concerns', 'Addressing Concerns', 'Details', 'Implementer', 'No longer doing adaptation']
			agency.treatment_adaptations.order("id ASC").each do |ta|
				csv << [
					ta.name,[ta.org_level, ta.provider_factors, ta.client_chars,
					ta.system_level, ta.other_reasons], [ ta.concerns, ta.other_concerns],
					[ta.proceed_with_plan, ta.seek_further_consultation, ta.address_concern, ta.address_concern_text],
					ta.adaptation_details, [ta.treatment_developer, ta.researcher, ta.agency_leader, ta.supervisor, ta.direct_provider, ta.implementation_team, ta.other_implementer],
					ta.not_doing_adaptation
					]
			end	

			csv << ['Specific strategy', 'Considerations', 'Selected for use', 'Details', 'Implementer']
			agency.treatment_strategies.order("id ASC").each do |ts|
				csv << [ts.name, [ts.use_currently, ts.feasible, ts.previous_success, ts.recommended],
						ts.selected, ts.specifics, ts.implementer
						]
			end	
			csv << ['Chosen Treatment']
			csv << [agency.agency_treatments.first.chosen_treatment] if agency.agency_treatments.first.chosen_treatment.present?
		end
  	end

  	def create_treatment_strategies
  		[
			"Develop agency leader characteristics supporting innovation and implementation", 
			"Recruit, designate, and train leaders for the change effort", 
			"Leaders mandate the use of the intervention strategies and packages", 
			"Conduct local consensus discussions", 
			"Involve existing governing structures in the implementation effort", 
			"Identify and prepare agency champions",
			"Involve clients and family members in the implementation effort",
			"Inform agency opinion leaders",
			"Recruit and cultivate relationships with partners in the implementation effort",
			"Develop resource sharing agreements",
			"Obtain formal commitments from key partners",
			"Develop academic partnerships",
			"Alter incentive/allowance structures",
			"Pay direct providers a set amount per client/family for delivering the new intervention",
			"Penalize direct providers financially for failure to implement the intervention",
			"Create fee structure where clients pay less for preferred interventions and more for less preferred interventions",
			"Work to place intervention on lists of actions for which providers can be reimbursed",
			"Fund and contract for the intervention",
			"Access new or existing money to facilitate the implementation and sustainment",
			"Make billing easier for the intervention",
			"Shift and revise roles among professionals who provide care; redesign job characteristics",
			"Change who serves on the clinical staff, adding different disciplines/skills to make it more likely the intervention will be delivered and/or be more successful",
			"Change the physical structure and/or intervention materials to facilitate implementation",
			"Change the location of clinical service sites to increase access to new intervention",
			"Change records systems to allow better assessment",
			"Facilitate relay of clinical data to direct providers",
			"Develop reminder systems designed to prompt direct providers to use the new intervention",
			"Pilot test the implementation effort and then gradually move to system-wide roll-out",
			"Model of simulate changes that will be implemented prior to system-wide implementation",
			"Implement changes in a cyclical fashion using small tests of change before taking changes system-wide",
			"Monitor clinical progress or outcomes for the purpose of quality assurance and improvement (Note: This should be paired with another implementation or sustainment strategy)",
			"Involve multiple kinds of stakeholders in a group to oversee use of the intervention",
			"Create a learning collaborative (also known as peer consultation networks, communities of practice, etc.) to support delivery of the intervention",
			"Provide direct providers ongoing supervision on the use of the new intervention",
			"Provide ongoing training for supervisors who will supervise direct providers using the new intervention",
			"Obtain commitment from direct providers to use self-monitoring fidelity techniques",
			"Develop and utilize fidelity-monitoring strategies, such as supervision, audit and feedback",
			"Develop and use a system to deliver technical assistance on the implementation of intervention",
			"Develop a system to monitor adherence to the implementation effort",
			"Allow direct providers protected time to reflect and support each other’s implementation effort",
			"Create/increase opportunities for clients and families to provide feedback about implementation of the intervention",
			"Leader prioritization and support",
			"Agency priorities and/or program needs are aligned with the new intervention ",
			"Maintain workforce skills through continued training, booster training sessions, supervision and feedback",
			"Maintain staff buy-in ",
			"Fund and contract for the intervention’s continued use",
			"Access new or existing money to facilitate sustainment",
			"Systematic adaptation of the intervention to increase fit/ compatibility of intervention with the agency",
			"Mutual adaptation between the intervention and agency (e.g., adaptation of the intervention to improve fit, alignment of the agency procedures with the intervention)"
		].each do |t|
			treatment_strategy = self.treatment_strategies.build name: t
			treatment_strategy.save
		end
  	end

  	def create_treatment_adaptations
  		[
  			"Tailoring/tweaking/refining the intervention",
			"Integrating components of the intervention into another framework",
			"Integrating another treatment into the intervention",
			"Removing/skipping core modules or components of the intervention",
			"Lengthening/extending session time",
			"Shortening/condensing session time",
			"Lengthening/extending number of weeks",
			"Shortening/condensing number of weeks",
			"Adjusting the order of intervention modules, topics, or segments",
			"Adding modules or topics to the intervention",
			"Not using/departing from the intervention",
			"Loosening the session structure",
			"Repeating elements or modules",
			"Substituting elements or modules",
			"Changing the setting",
			"Changing who delivers the intervention",
			"Changing the format by which the treatment is delivered",
			"Changing the target population for the intervention"
		].each do |t|
			treatment_adaptation = self.treatment_adaptations.build name: t
			treatment_adaptation.save
		end
  	end

  	def create_agency_treatments
		agency_treatment = self.agency_treatments.build
		agency_treatment.save
  	end

	def activity_complete?( activity )
		self.responses.where( activity_id: activity.id ).count >= activity.questions.where( required: true ).count
	end

	def phase_complete?( phase )
		if phase.id == 1
			return self.responses.where( question_id: 1 ).last.try( :content ) == 'yes' && self.responses.where( question_id: 2 ).last.try( :content ) == 'yes'
		end
		self.responses.where( phase_id: phase.id ).count >= phase.questions.where( required: true ).count
	end

	def step_complete?( step )
		self.responses.where( step_id: step.id ).count >= step.questions.where( required: true ).count
	end

	def lead
		self.agency_users.find_by(role: "lead").user
	end

	def to_s
		self.name
	end
	
end