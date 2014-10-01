desc "Loader"

namespace :activities do

	task load: :environment do

		radio_prompts = [
			{
				content: 'yes',
				value: 1,
				seq: 1
			},
			{
				content: 'no',
				value: 0,
				seq: 2
			},
			{
				content: 'DK',
				value: nil,
				seq: 3
			}
		]

		################################
		# Phase 1

		p1 = Phase.create name: 'phase_1', label: 'Phase 1', seq: 1
		
		step = p1.steps.create seq: 1
		a = step.activities.create name: 'complete_assessment'
		q = a.questions.create content: 'Is the Agency Assessment Complete?'

		step = p1.steps.create seq: 2
		a = step.activities.create name: 'receptivity_to_treatment'
		q = a.questions.create content: 'Is the Agency Assessment Receptive to Treatment?'

		puts p1.label

		################################
		# Phase 2


		p2 = Phase.create name: 'phase_2', label: 'Phase 2', seq: 2
		puts p2.label
			step1 = p2.steps.create seq: 1
			step1.activities.create seq: 1 # the resource

		step2 = p2.steps.create seq: 2

		act = step2.activities.create seq: 1

		[
			"Does this treatment fit with the value system of your agency?",
			"Is this treatment likely to fit the need that was identified in the ACT SMART Agency Assessment?",
			"Will this treatment fit with the philosophy of your agency?",
			"Do you believe that staff and consumers feel/will feel that this treatment fits with the mission and aim of your agency?",
			"Do you think that this treatment will be useful for your agency, staff, or clients?",
			"Does the treatment fit with the culture of the clients served at your agency or the culture of the community?"		
		].each_with_index do |q, i|
			q = act.questions.create seq: i+1, content: q
			puts q.content
		end



		act = step2.activities.create seq: 2

		[
			"Will it be possible to provide this treatment in the setting that you typically deliver services (home, clinic, school, etc.)?",
			"Does your agency have the staff, materials, space, and other necessities to deliver this treatment?",
			"Will this treatment be able to be delivered within your agency without modification?",
			"Will this treatment be used daily by multiple staff?",
			"Can components of this treatment be tried out to evaluate its utility or suitability?",
			"Is the treatment administratively feasible, given the policies and procedures of your agency?"		
		].each_with_index do |q, i|
			q = act.questions.create seq: i+1, content: q
			puts q.content
		end


		act = step2.activities.create seq: 3

		[
			"Are the <b>outcomes</b> potentially achieved by the treatment meaningful and important to your <b>agency overall</b>?",
			"Are the <b>outcomes</b> potentially achieved by the treatment meaningful and important to the <b>service providers</b> at your agency?",
			"Are the <b>outcomes</b> potentially achieved by the treatment meaningful and important to the <b>clients and families</b> at your agency?",
			"Do the <b>benefits</b> of the treatment <b>outweigh any potential risks</b> to your clients, service providers, and agency?",
			"Has the treatment been <b>evaluated in community agencies</b> (e.g., such as your agency) and demonstrate <b>positive results</b>? "
		].each_with_index do |q, i|
			q = act.questions.create seq: i+1, content: q, section: 'section_1'
			puts q.content
		end

		[
			"Was the treatment study published in a <b>scientific journal</b> (i.e., a peer-reviewed academic journal)?",
			"Did the treatment study use a <b>comparison group</b> to test whether their treatment achieved <b>better results</b> compared to another group?",
			"Did the treatment study take into consideration how <b>other factors</b> (e.g., age, IQ, ASD severity, etc.) may have influenced the results?",
			"Were the researchers <b>critical of their own study</b> (e.g., address study limitations, offer alternative explanations, consider areas for improvement, etc.)?",
			"Has <b>more than 1 research team</b> tested this treatment and obtain positive results?"
		].each_with_index do |q, i|
			q = act.questions.create seq: i+1, content: q, section: 'section_2'
			puts q.content
		end



		act = step2.activities.create seq: 4

		q = act.questions.create seq: 1, name: 'are_there_training_requirements'

		q = act.questions.create seq: 2, name: 'what_staff_are_required', question_type: 'multi_select', section: 'staff_involved'
		[
			"Direct Providers", "Support Staff", "Supervisors", "Agency Leaders"
		].each do |prompt|
			q.prompts.create content: prompt
		end
		q = act.questions.create seq: 3, name: 'what_staff_are_required_other', section: 'staff_involved', required: false


		q = act.questions.create seq: 4, name: 'who_is_required', question_type: 'multi_select', section: 'staff_involved'
		[
			"Direct Providers", "Outside Trainer", "Supervisors", "Agency Leaders", "Support Staff"
		].each do |prompt|
			q.prompts.create content: prompt
		end
		q = act.questions.create seq: 5, name: 'who_is_required_other', section: 'staff_involved', required: false

		q = act.questions.create seq: 6, name: 'training_model_required', question_type: 'multi_select', section: 'training_model'
		[
			"Didactics", "Educational brochure/handout", "Workshop / Seminars", "Online Training", "On-the-job training"
		].each do |prompt|
			q.prompts.create content: prompt
		end
		q = act.questions.create seq: 7, name: 'training_model_required_other', section: 'training_model', required: false


		q = act.questions.create seq: 8, name: 'training_strategies_required', question_type: 'multi_select', section: 'training_model'
		[
			"Behavior rehearsal", "Role playing", "PowerPoint presentations", "Reading materials", "Modeling", "Watching videos", "Group activities", "Supervision", "Individual activities", "Shadowing", "Active participation"
		].each do |prompt|
			q.prompts.create content: prompt
		end
		q = act.questions.create seq: 9, name: 'training_strategies_required_other', section: 'training_model', required: false


		q = act.questions.create seq: 10, name: 'training_materials_required', question_type: 'multi_select', section: 'training_model'
		[
			"Manuals", "Toolkits", "Handouts/Brochures", "Technology devices", "Guidelines", "Videos"
		].each do |prompt|
			q.prompts.create content: prompt
		end
		q = act.questions.create seq: 11, name: 'training_materials_required_other', section: 'training_model', required: false


		q = act.questions.create seq: 12, name: 'outside_training_required', section: 'outside_training'
		
		q = act.questions.create seq: 13, name: 'which_staff_need_outside_training', question_type: 'multi_select', section: 'outside_training'
		[
			"Direct providers", "One staff member who can train the rest of the staff in your agency (train-the-trainer)", "Supervisors", "Agency leaders", "Support staff"
		].each do |prompt|
			q.prompts.create content: prompt
		end
		q = act.questions.create seq: 14, name: 'which_staff_need_outside_training_other', section: 'outside_training', required: false


		q = act.questions.create seq: 15, name: 'training_duration_required', section: 'duration_of_training'
		q = act.questions.create seq: 16, name: 'training_duration', section: 'duration_of_training'

		q = act.questions.create seq: 17, name: 'training_travel_required', section: 'travel'

		q = act.questions.create seq: 18, name: 'which_staff_need_training_travel', question_type: 'multi_select', section: 'travel'
		[
			"Direct providers", "Support staff", "Supervisors", "Agency leaders"
		].each do |prompt|
			q.prompts.create content: prompt
		end
		q = act.questions.create seq: 19, name: 'which_staff_need_training_travel_other', section: 'travel', required: false
		q = act.questions.create seq: 20, name: 'training_travel_destination', section: 'travel', required: false


		q = act.questions.create seq: 21, name: 'training_maintenance_required', section: 'maintenance'
		q = act.questions.create seq: 22, name: 'training_maintenance_who', question_type: 'multi_select', section: 'maintenance'
		[
			"Direct provider(s)", "Support staff", "Supervisor (s)", "Outside trainer(s)", "Agency leader(s)", "Clinical Director(s)"
		].each do |prompt|
			q.prompts.create content: prompt
		end
		q = act.questions.create seq: 23, name: 'training_maintenance_who_other', section: 'maintenance', required: false

		q = act.questions.create seq: 24, name: 'training_maintenance_components', question_type: 'multi_select', section: 'maintenance'
		[
			"Ongoing consultation", "Booster sessions", "Supervision upon request", "Submission of videos", "Submission of materials", "Regular supervision"
		].each do |prompt|
			q.prompts.create content: prompt
		end
		q = act.questions.create seq: 25, name: 'training_maintenance_components_other', section: 'maintenance', required: false


		q = act.questions.create seq: 26, name: 'training_certificate_required', section: 'provider_credentials'
		q = act.questions.create seq: 27, name: 'training_certificate_name', section: 'provider_credentials'

		q = act.questions.create seq: 28, name: 'certification_required', section: 'provider_credentials'
		q = act.questions.create seq: 29, name: 'certification_name', section: 'provider_credentials'

		q = act.questions.create seq: 30, name: 'degree_required', question_type: 'multi_select', section: 'provider_credentials'
		[
			"High school diploma", "Doctoral degree", "Bachelor’s degree", "Master’s degree"
		].each do |prompt|
			q.prompts.create content: prompt
		end
		q = act.questions.create seq: 31, name: 'degree_required_other', section: 'provider_credentials', required: false

		q = act.questions.create seq: 32, name: 'discipline_required', question_type: 'multi_select', section: 'provider_credentials'
		[
			"Psychology", "Physical Therapy", "Marriage and Family Therapy", "Education", "Social Work", "Behavior Specialist", "Speech / Language/ Communication", "Occupational Therapy"
		].each do |prompt|
			q.prompts.create content: prompt
		end
		q = act.questions.create seq: 33, name: 'discipline_required_other', section: 'provider_credentials', required: false

		q = act.questions.create seq: 34, name: 'years_experience_required', section: 'provider_credentials'
		q = act.questions.create seq: 35, name: 'years_experience', section: 'provider_credentials'

		q = act.questions.create seq: 36, name: 'additional_training_required', section: 'additional_requirements'
		q = act.questions.create seq: 37, name: 'additional_training', section: 'additional_requirements', required: false



		act = step2.activities.create seq: 5
		q = act.questions.create seq: 1, name: 'next_steps', required: false
		q = act.questions.create seq: 2, name: 'explain', required: false



		act = step2.activities.create seq: 6
		q = act.questions.create seq: 1, name: 'improve_outcomes_yes_no'
		q = act.questions.create seq: 2, name: 'improve_outcomes_importance'
		q = act.questions.create seq: 3, name: 'what_outcomes', required: false

		q = act.questions.create seq: 4, name: 'improve_satisfaction_yes_no'
		q = act.questions.create seq: 5, name: 'improve_satisfaction_importance'

		q = act.questions.create seq: 6, name: 'improve_retention_yes_no'
		q = act.questions.create seq: 7, name: 'improve_retention_importance'

		q = act.questions.create seq: 8, name: 'reach_new_yes_no'
		q = act.questions.create seq: 9, name: 'reach_new_importance'
		q = act.questions.create seq: 10, name: 'had_inquiries_yes_no'
		q = act.questions.create seq: 11, name: 'had_inquiries_importance'

		q = act.questions.create seq: 12, name: 'reimbursement_yes_no'
		q = act.questions.create seq: 13, name: 'reimbursement_importance'
		q = act.questions.create seq: 14, name: 'reimbursement_who', required: false
		q = act.questions.create seq: 15, name: 'reimbursement_rates', required: false

		q = act.questions.create seq: 16, name: 'termination_of_clients_yes_no'
		q = act.questions.create seq: 17, name: 'termination_of_clients_importance'

		q = act.questions.create seq: 18, name: 'improve_reputation_yes_no'
		q = act.questions.create seq: 19, name: 'improve_reputation_importance'
		q = act.questions.create seq: 20, name: 'increase_marketability_yes_no'
		q = act.questions.create seq: 21, name: 'increase_marketability_importance'



		step3 = p2.steps.create seq: 3












		################################
		# Phase 3

		p3 = Phase.create name: 'phase_3', label: 'Phase 3', seq: 3
		puts p3.label

		step1 = p3.steps.create seq: 1

		act = step1.activities.create seq: 1, name: 'gathering_treatment_materials'
		q = act.questions.create seq: 1, name: 'which_sources_obtained', question_type: 'multi-select'
		[
			"Intervention manual", "Resources from other professionals", "Journal Article(s)", "Resources from conference/seminar", "Website/online resources", " Informational videos/media"
		].each do |prompt|
			q.prompts.create content: prompt
		end
		q = act.questions.create seq: 2, name: 'which_sources_obtained_other', required: false



		act = step1.activities.create seq: 2, name: 'evaluating_adaptions'
		i = 1
		[
			"Tailoring/tweaking/refining the intervention (e.g., changing terminology or language, modifying worksheets in minor ways)?",
			"Integrating components of the intervention into another framework (e.g., selecting elements to use but not using whole protocol)?",
			"Integrating another treatment into the intervention (e.g., integrating other techniques into the intervention) ",
			"Removing/skipping core modules or components of the intervention?",
			"Lengthening/extending session time?",
			"Shortening/condensing session time?",
			"Lengthening/extending number of weeks?",
			"Shortening/condensing number of weeks?",
			"Adjusting the order of intervention modules, topics, or segments?",
			"Adding modules or topics to the intervention?",
			"Not using/departing from the intervention to use something else for part of the session or not using the intervention altogether?",
			"Loosening the session structure?",
			"Repeating elements or modules (e.g., repeating a concept or activity covered in a previous session that was not intended for another session)?",
			"Substituting elements or modules?"
		].each do |q|
			q = act.questions.create seq: i, content: q, section: 'content_adaptations'
			puts q.content
			i += 1
		end

		[
			"Changing the setting (e.g., delivering an intervention in a school rather than clinic)?",
			"Changing who delivers the intervention (e.g., a peer instead of a clinician)?",
			"Changing the format by which the treatment is delivered (e.g., offering an individual treatment in a group or telephone format)?",
			"Changing the target population for the intervention (e.g., an intervention intended to treat children with disruptive behavior will be used to treat children with ASD)."
		].each do |q|
			q = act.questions.create seq: i, content: q, section: 'context_adaptations'
			puts q.content
			i += 1
		end







		act = step1.activities.create seq: 3, name: 'treatment_adaptation_plan'

		step2 = p3.steps.create seq: 2
		act = step2.activities.create seq: 1, name: 'training_plan'

		step3 = p3.steps.create seq: 3
		act = step3.activities.create seq: 1, name: 'implementation_plan'


		################################
		# Phase 4

		p4 = Phase.create name: 'phase_4', label: 'Phase 4', seq: 4
		puts p4.label

		step1 = p4.steps.create seq: 1
		act = step1.activities.create seq: 1, name: 'action_step_evaluation'

		step2 = p4.steps.create seq: 2
		act = step2.activities.create seq: 1, name: 'action_evaluation_2'

		step3 = p4.steps.create seq: 3
		act = step3.activities.create seq: 1, name: 'action_evaluation_3'






	end

end


