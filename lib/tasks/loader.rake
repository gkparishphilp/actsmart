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

		q = act.questions.create seq: 1, name: 'using_train_the_trainer'

		q = act.questions.create seq: 2, name: 'training_internal_or_external', question_type: 'radio'
		[
			"Outside of the agency", "Inside the agency"
		].each do |prompt|
			q.prompts.create content: prompt
		end

		q = act.questions.create seq: 3, name: 'what_staff_are_trained', question_type: 'multi_select', section: 'external_training'
		[
			"Direct Providers", "Support Staff", "Supervisors", "Agency Leaders"
		].each do |prompt|
			q.prompts.create content: prompt
		end

		q = act.questions.create seq: 4, name: 'what_staff_are_trained_other', section: 'external_training', required: false
		q = act.questions.create seq: 5, name: 'how_many_staff_trained', section: 'external_training'
		q = act.questions.create seq: 6, name: 'who_will_train', section: 'external_training'
		q = act.questions.create seq: 7, name: 'outside_prep_required', section: 'external_training'

		q = act.questions.create seq: 8, name: 'outside_training_options', question_type: 'multi_select', section: 'external_training'
		[
			"Reading materials", "Practicing with clients", "Watching videos", "Role play with staff", "Online training or modules"
		].each do |prompt|
			q.prompts.create content: prompt
		end

		q = act.questions.create seq: 9, name: 'outside_training_options_other', section: 'external_training'
		q = act.questions.create seq: 10, name: 'training_time', section: 'external_training'
		q = act.questions.create seq: 11, name: 'who_trains', section: 'external_training'
		q = act.questions.create seq: 12, name: 'training_scheduled', section: 'external_training'
		q = act.questions.create seq: 13, name: 'training_scheduled_time', section: 'external_training'
		q = act.questions.create seq: 14, name: 'training_outside_scheduled', section: 'external_training'
		q = act.questions.create seq: 15, name: 'staff_training_time', section: 'external_training'
		q = act.questions.create seq: 16, name: 'cost_effective_training_times', section: 'external_training'
		q = act.questions.create seq: 17, name: 'cover_staff_for_training', section: 'external_training'
		q = act.questions.create seq: 18, name: 'who_will_cover_staff', section: 'external_training'
		q = act.questions.create seq: 19, name: 'makeup_sessions', section: 'external_training'
		q = act.questions.create seq: 20, name: 'makeup_session_times', section: 'external_training'
		q = act.questions.create seq: 21, name: 'makeup_session_location', section: 'external_training'
		q = act.questions.create seq: 22, name: 'travel_for_training', section: 'external_training'
		q = act.questions.create seq: 23, name: 'travel_organizer', section: 'external_training'
		q = act.questions.create seq: 24, name: 'travel_arrangements', section: 'external_training'

		q = act.questions.create seq: 25, name: 'what_staff_are_trained', question_type: 'multi_select', section: 'external_training'
		[
			"Direct Providers", "Support Staff", "Supervisors", "Agency Leaders"
		].each do |prompt|
			q.prompts.create content: prompt
		end

		q = act.questions.create seq: 26, name: 'what_staff_are_traveling_other', section: 'external_training', required: false
		q = act.questions.create seq: 27, name: 'how_many_traveling', section: 'external_training', required: false
		q = act.questions.create seq: 28, name: 'traveling_to', section: 'external_training', required: false
		q = act.questions.create seq: 29, name: 'departing', section: 'external_training', required: false
		q = act.questions.create seq: 30, name: 'returning', section: 'external_training', required: false
		q = act.questions.create seq: 31, name: 'traveling_via', section: 'external_training', required: false


		# End of Activity 1
		################################

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








		puts 'Pages'

		p = Page.create title: 'about', content: <<-END
			<center>
              <h1>
                About ACT SMART
              </h1>
            </center>
          </div>
        </div>
        <div class='row'>
          <div class='col-xs-8'>
            <h2>
              Introduction
            </h2>
            <div class='video-container'>
              <iframe allowfullscreen frameborder='0' height='315' src='//www.youtube.com/embed/nlEDHwChto4' width='560'></iframe>
            </div>
            <h2>
              Description of the ACT SMART Model
            </h2>
            <p>
              The Autism-Community Toolkit: Systems toMeasure and Adopt Research-based Treatments (ACT SMART) is a comprehensive toolkit developed for agencies that provide services to individuals with autism spectrum disorder (ASD). ACT SMART assists agencies successfully implement new research-based treatments.
            </p>
            <p>
              Specifically, ACT SMART:
              <ul>
                <li>
                  <i>
                    Assists
                  </i>
                  in identifying training and service delivery gaps and selecting effective treatments to meet agency-wide needs.
                </li>
                <li>
                  <i>
                    Facilitates
                  </i>
                  treatment adoption decisions.
                </li>
                <li>
                  <i>
                    Guides
                  </i>
                  designing effective training and implementation strategies.
                </li>
                <li>
                  <i>
                    Supports
                  </i>
                  efforts that will sustain use of effective treatments.
                </li>
              </ul>
            </p>
            <p>
              ACT SMART was developed from the Autism Model of Implementation (AMI), a framework guiding the implementation and sustainment of research-based treatments within ASD community services (refer to Figure 1).
            </p>
          </div>
          <div class='col-xs-4'>
            <div class='well'>
              <center>
                <h3>
                  ACT SMART Model
                </h3>
              </center>
              <p>
                <u>
                  Goal of ACT SMART:
                </u>
                Assist ASD community-based agencies to identify needs, select and evaluate research-based treatments, and develop strategies to support implementation and sustained use.
              </p>
              <p>
                <u>
                  Target Agencies:
                </u>
                Community-based agencies providing intervention services to individuals with autism spectrum disorder.
              </p>
            </div>
          </div>
        </div>
        <div class='row'>
          <div class='col-xs-12'>
            <h4>
              Autism Model of Implementation (AMI) Phases and ACT SMART Steps
            </h4>
            <center>
              <img alt="Figure1" class="img img-responsive" src="/assets/figure1.jpg" />
            </center>
            <h2>
              ACT SMART Phases and Steps
            </h2>
            <p>
              ACT SMART consists of four phases, with corresponding action steps that systematically guide agency leaders and teams toward successful identification, implementation and sustained use of a new research-based treatment. There is no set time to complete each phase or step; however, it is recommended that all of the steps be completed. The four phases include:
            </p>
            <ul>
              <li>
                <b>Phase 1 – Identify Practice and Delivery Gaps:</b>
                The purpose of this phase is to identify an agency’s areas of strength and opportunities for growth.
              </li>
              <li>
                <b>Phase 2 – Treatment Selection and Adoption Decision:</b>
                During this phase, agency leaders and implementation teams identify potential research-based treatments and evaluate whether the treatment should be adopted within the agency.
              </li>
              <li>
                <b>Phase 3 – Planning for Implementation:</b>
                The purpose of this phase is to guide the development of a training plan, treatment adaptation plan (if needed), and implementation and sustainment strategy plan.
              </li>
              <li>
                <b>Phase 4 – Implementation and Sustainment:</b>
                This phase tracks progress of the adaptation, training, implementation and sustainment plans, and provides guidance for overcoming common implementation obstacles that may arise.
              </li>
            </ul>
            <h2>
              ACT SMART Is…
            </h2>
            <ul>
              <li>
                <b>Comprehensive.</b>
                ACT SMART uses multiple strategies to guide agency leaders from evaluating agency needs through planning for treatment adaptation, staff training and implementation, and to using strategies to maintain treatment use.
              </li>
              <li>
                <b>Systematic.</b>
                ACT SMART is comprised of four phases. Each phase has steps that facilitate progress within the phase and between phases. The systematic approach provides a structure and sequence to organize activities to implement new research-based treatments efficiently and effectively.
              </li>
              <li>
                <b>Research-based.</b>
                ACT SMART is comprised of research-based phases and steps that are designed to increase the efficiency and effectiveness of agencies to implement research-based treatments. The phases comprising ACT SMART (identify practice and delivery gaps, treatment selection and adoption decision, planning for implementation, and implementation with sustainment) have been studied using rigorous scientific methods in a variety of service settings (Brownson et al., 2012).
              </li>
            </ul>
            <h2>
              ACT SMART Emphasizes…
            </h2>
            <ul>
              <li>
                <b>Building capacity within agencies.</b>
                Agency leaders receive training and ongoing facilitation for one year to support use of ACT SMART.
              </li>
              <li>
                <b>Individualization to meet agency needs.</b>
                ACT SMART allows for individualization and flexibility within a structured set of activities and phases. It guides agencies to identify and adopt any research-based treatment that may best fit their specific needs. Additionally, agencies can individualize targeted strategies to adapt treatments, train staff, and begin using the treatment. Finally, ACT SMART allows the agency to determine who will participate in decision-making, planning, and implementation activities.
              </li>
              <li>
                <b>Fit and Feasibility with agencies.</b>
                Treatments must fit with the climate and culture of an agency to be successfully implemented and used over time. Additionally, the ease of implementing a treatment so that it can work well within the existing structure of an agency is critical for its success. ACT SMART assists agencies in evaluating the fit and feasibility of implementing a treatment in their agency to guide their adoption decision, planning and use of a treatment.
              </li>
              <li>
                <b>Using best practices for individuals with ASD.</b>
                ACT SMART was designed to support the successful use of research-based treatments by matching effective treatments with agency needs and characteristics.
              </li>
            </ul>
            <h2>
              Who Should Use ACT SMART?
            </h2>
            <p>
              ACT SMART was explicitly developed for use by community agencies providing services to individuals with ASD. It was designed for use among a variety of ASD providers, such as behavioral service providers, speech and language pathologists, and mental health service providers.
            </p>
            <h2>
              Why was ACT SMART Developed?
            </h2>
            <p>
              This toolkit was developed to improve the process of implementing research-based treatments for individuals with ASD in community-based agencies. Our research and collaboration with community agency leaders suggests that most ASD community agencies do not have a systematic method for identifying treatment and training needs, matching research-based treatments to specific needs, or supporting initial training, implementation or sustained use over time. ASD community-based agencies play an integral role in addressing the developmental and behavioral problems, and core challenges that are common in ASD. Therefore, it is important that agencies have the tools necessary to efficiently and effectively implement research-based treatments.
            </p>
            <h2>
              How was ACT SMART Developed?
            </h2>
            <p>
              ACT SMART was developed with funding from the National Institutes of Mental Health (NIMH) and in partnership with a team of community agency leaders (AMI Collaborative group). The AMI Collaborative group is comprised of 8 community providers delivering behavioral, speech and language, and mental health services to individuals with ASD, an implementation scientist, and several researchers. The AMI Collaborative group has met quarterly for a year and a half to develop the specific tools within this ACT SMART toolkit. Together, we integrated current procedures used by ASD community-based agencies to adopt and implement research-based treatments and available literature on implementation models and strategies to develop the ACT SMART materials.
            </p>
            <br>
            <br>
            <br>
            <br>
          </div>
        </div>
      </div>

	END

	puts p.title

	p=Page.create title: 'project_team', content: <<-END
			<center>
              <h1>
                The Team
              </h1>
            </center>
          </div>
        </div>
        <div class='row' style='margin-top: 2em;'>
          <div class='col-xs-3'>
            <img alt="Drahota" class="img img-responsive pull-right" src="/assets/drahota.jpg" />
          </div>
          <div class='col-xs-9'>
            <h3 style='margin-top: 0;'>
              <a href="mailto:adrahota@mail.sdsu.edu" style="color: #000; ">Dr. Amy Drahota, Ph.D.</a>
            </h3>
            <div class='subtitle'>
              Principal Investigator
            </div>
            <p>
              Dr. Drahota is an Assistant Research Professor of Psychology at San Diego State University and the Child and Adolescent Services Research Center (CASRC). Her research focuses on developing and evaluating implementation strategies to help agencies provide the best and most effective research-based treatments to youth with autism spectrum disorder (ASD).
            </p>
            <h5 style='font-weight: bold;'>
              Why is the ACT SMART toolkit important?
            </h5>
            <p>
              My goal is to develop a toolkit that builds the strengths of community agencies toprovide research-based treatments to individuals with autism. It is also critically important that the toolkit be easy to use, relevant, and cost-effective for agencies. It is my aim for the ACT SMART toolkit to meet these goals.
            </p>
            <p>
              I’m excited to be working closely with community agencies caring for individuals with autism to share what we have developed and learn more about how to best use the ACT SMART toolkit.
            </p>
          </div>
        </div>
        <div class='row' style='margin-top: 2em;'>
          <div class='col-xs-3'>
            <img alt="Rosemary" class="img img-responsive pull-right" src="/assets/rosemary.jpg" />
          </div>
          <div class='col-xs-9'>
            <h3 style='margin-top: 0;'>
              Rosemary Meza, B.A.
            </h3>
            <div class='subtitle'>
              Research Assistant
            </div>
            <p>
              Rosemary was a Research Assistant at San Diego State University and the Child and Adolescent Services Research Center (CASRC) during the development of the ACT SMART toolkit. She is currently in the Clinical Psychology Doctoral Program at the University of Washington. Her research interests focus on improving mental health services through the settings.
            </p>
            <h5 style='font-weight: bold;'>
              Why is the ACT SMART toolkit important?
            </h5>
            <p>
              As a former direct provider in an ASD community agency, I am strongly invested in
              the improvement of outcomes for individuals with autism. I believe the ACT SMART
              toolkit has the potential to improve client outcomes through assisting community
              agencies in identifying and implementing a research-based treatment that best suits
              their needs. I look forward to the valuable insight that will be gained through testing
              the ACT SMART toolkit in ASD community agencies.
            </p>
          </div>
        </div>
        <div class='row' style='margin-top: 2em;'>
          <div class='col-xs-3'>
            <img alt="Jon" class="img img-responsive pull-right" src="/assets/jon.jpg" />
          </div>
          <div class='col-xs-9'>
            <h3 style='margin-top: 0;'>
              <a href="mailto:jonathan.martinez@mail.sdsu.edu" style="color: #000; ">Dr. Jonathan Martinez, Ph.D.</a>
            </h3>
            <div class='subtitle'>
              Postdoctoral Research Fellow
            </div>
            <p>
              Dr. Martinez is a Postdoctoral Research Fellow at San Diego State University and
              the Child and Adolescent Services Research Center (CASRC). His research focuses
              on bridging the gap between science and practice by focusing on the design,
              implementation, and evaluation of culturally-sensitive
              health services for diverse children and families.
            </p>
            <h5 style='font-weight: bold;'>
              Why is the ACT SMART toolkit important?
            </h5>
            <p>
              The ACT SMART toolkit has been designed be used flexibly to meet the needs
              of community-based agencies providing services for individuals with Autism
              Spectrum Disorder (ASD). I believe the toolkit will assist agencies in identifying
              and implementing evidence-based interventions for individuals with ASD and
              their families, and develop strategies for their sustained use. I am excited at the
              opportunity to build and foster relationships with community agencies and gain
              increased awareness on how best to support agencies at implementing evidence-
              based interventions.
            </p>
          </div>
        </div>
      </div>
	END

	puts p.title

	p=Page.create title: 'faqs', content: <<-END
		<center>
              <img alt="Logo wide" src="/assets/logo_wide.png" />
            </center>
          </div>
          <div class='col-xs-12'>
            <center>
              <h3>
                Frequently Asked Questions
              </h3>
            </center>
          </div>
          <div class='col-xs-12'>
            <h4 style='text-decoration:underline;'>
              What is the ACT SMART toolkit?
            </h4>
            <p>
              The ACT SMART toolkit is a web-based, comprehensive toolkit developed for agencies that provide services to children with autism spectrum disorder (ASD). ACT SMART assists Implementation Teams to successfully implement new research-based treatments throughout the agency. Specifically, the four phases of ACT SMART will:
              <ul>
                <li>
                  Assists your agency’s Implementation Team to identify training and service delivery gaps and select research-based treatments to meet agency-wide needs.
                </li>
                <li>
                  Facilitate treatment adoption decisions.
                </li>
                <li>
                  Guide your agency’s Implementation Team to design effective training and use effective implementation strategies.
                </li>
                <li>
                  Support efforts that will sustain the use of research-based treatments.
                </li>
              </ul>
            </p>
            <h4 style='text-decoration:underline;'>
              What is the purpose of this study?
            </h4>
            <p>
              The purpose of this study is to evaluate the feasibility, acceptability, usefulness, and fidelity of the ACT SMART toolkit to determine whether it fits within your agency’s structure and helps to meet your agency’s needs.
            </p>
            <h4 style='text-decoration:underline;'>
              How will ACT SMART benefit my agency?
            </h4>
            <p>
              The ACT SMART toolkit aims to help your agency grow and meet the needs of your current and future clients. This toolkit will provide you with a comprehensive assessment of your agency’s areas of strengths and areas for growth, and provide recommendations for your agency. It will also provide structure for your agency evaluate whether a treatment should be adopted, provide planning tools related to adapting, training, and implementing a new research-based treatment, and support your agency as staff begin to use the treatment.
            </p>
            <h4 style='text-decoration:underline;'>
              How much time will ACT SMART really take?
            </h4>
            <p>
              We recommend that Implementation Teams spend at least 2 hours a month on ACT SMART web-based activities and an additional hour for the ACT SMART facilitation meetings (approximately 36 hours during the course of the year). However, the total amount of time that your agency’s Implementation Team spends on the ACT SMART activities will vary based on the number of members on the Implementation Team, how much planning is required, and the size of your agency. Research activities related to the study will take approximately 6½ hours throughout the year.
            </p>
          </div>
        </div>
      </div>
	END

	puts p.title

	p=Page.create title: 'getting_ready', content: <<-END
		<ol class='breadcrumb'>
              <li>
                <a href="/dashboard">Dashboard</a>
              </li>
              <li>
                Getting Ready
              </li>
            </ol>
          </div>
        </div>
        <div class='row'>
          <div class='col-sm-12'>
            <h1>
              Getting Ready for ACT SMART Phases 2-4
            </h1>
            <p>
              This section provides guidance on how to prepare for the next phases (2-4) of the ACT SMART toolkit. There are a few decisions to make before you get started with the next phases. Making these decisions now will be helpful so that you can efficiently and most effectively use your time.
            </p>
            <div class='well' style='float:right;width:25%;'>
              <strong style='text-align: center;'>
                Getting Ready Checklist
              </strong>
              <ul>
                <li>
                  Identify who will complete the ACT SMART materials
                </li>
                <li>
                  Schedule regular times to read, review, and complete the ACT SMART activities
                </li>
                <li>
                  Connect with staff who might understand the perspectives of staff or provide different information
                </li>
                <li>
                  Call the ACT SMART facilitator if any questions or concerns arise
                </li>
                <li>
                  Attend the monthly ACT SMART facilitation meetings
                </li>
              </ul>
            </div>
            <p style='font-style: italic;'>
              Who should be a part of the ACT SMART team at my agency?
            </p>
            <p>
              ACT SMART was developed to be flexible and fit with many different types of agency structures. We recommend identifying a specific person or team of people to complete the ACT SMART activities. This will help to ensure consistency and completion of materials.
            </p>
            <p>
              There are different options for who can complete ACT SMART materials: 1) an agency leader or 2) an implementation team.
            </p>
            <ul>
              <li style='margin-bottom:1em;'>
                <u>
                  Agency leader.
                </u>
                Identify an agency leader who will be responsible for completing ACT SMART materials. This person should be the decision-maker in the agency. That is, this person should have the opportunity and independence to decide the specific treatments to implement within an agency. It is important that the person identified completes all ACT SMART materials for consistency in reporting. However, we suggest that the agency leader not work in total isolation from agency staff. Communicating with agency staff increases buy-in for the treatment that is identified and implemented throughout the agency.
              </li>
              <li>
                <u>
                  Implementation Team.
                </u>
                Alternatively, an implementation team comprised of agency staff can be formed to complete ACT SMART materials. For this team format, it is recommended to have regularly-scheduled team meetings to discuss and complete materials. If this team format option is chosen, please see our “Tips to promote collaborative and successful implementation teams.”
              </li>
            </ul>
            <h3>
              General tips for completing ACT SMART Phases 2-4
            </h3>
            <ul>
              <li style='margin-bottom:1em;'>
                It is highly recommended to set aside a regularly scheduled day and time to complete and review ACT SMART materials. It is recommended that at least two hours per month be devoted to reading and completing ACT SMART materials.
              </li>
              <li style='margin-bottom:1em;'>
                Some of the ACT SMART materials are very brief whereas others are more time-consuming to complete. We are confident that the more time you put in to completing ACT SMART materials fully, the more information and feedback you will receive to make well-informed adoption decisions of research-based treatments.
              </li>
              <li style='margin-bottom:1em;'>
                It is important to identify key stakeholders at your agency (e.g., opinion leaders, innovators, etc.). These staff members have a lot of influence on staff perceptions, attitudes, and acceptance of new research-based treatments. Additionally, these staff members are the individuals who will be able to let you know the general consensus of your staff and barriers to be problem-solved during the implementation process.
              </li>
              <li style='margin-bottom:1em;'>
                Strategic planning in engaging agency staff at all levels in the ACT SMART process will promote staff buy-in of research-based treatments and promote a positive culture.
              </li>
            </ul>
            <h3>
              Tips to promote collaborative and successful implementation teams
            </h3>
            <ul>
              <li>
                The implementation of any new treatment is as much a social process as it is a technical one. The services your agency providers are embedded in a social context that includes the direct provider, supervisor, agency leader, agency, and community. Successful implementation of a new treatment is a function of how well the social context complements and supports the objectives of the treatment (Glisson & Schoenwald, 2005).
              </li>
              <li>
                Specific factors have been found to facilitate collaboration among groups and include (Drahota et al., 2014):
                <div class='col-sm-8 col-sm-offset-2'>
                  <table class='table'>
                    <tr>
                      <td>
                        Trust between team members
                      </td>
                      <td>
                        Respect among team members
                      </td>
                    </tr>
                    <tr>
                      <td>
                        Good relationship between team members
                      </td>
                      <td>
                        Shared vision, goals, and/or mission
                      </td>
                    </tr>
                    <tr>
                      <td>
                        Effective and/or frequent communication
                      </td>
                      <td>
                        Well-structured meetings
                      </td>
                    </tr>
                    <tr>
                      <td>
                        Clearly identified roles and functions of team members
                      </td>
                      <td>
                        Effective conflict resolution
                      </td>
                    </tr>
                    <tr>
                      <td>
                        Good quality of leadership
                      </td>
                      <td>
                        Mutual benefit for all members
                      </td>
                    </tr>
                    <tr>
                      <td>
                        Good selection of team members
                      </td>
                      <td>
                        Positive impact on agency
                      </td>
                    </tr>
                  </table>
                </div>
                <div class='clearfix'></div>
              </li>
              <li>
                Additionally, effective implementation teams:
                <ul>
                  <li>
                    Foster relationships with key staff at their agency to build relationships among providers, supervisors, agency leaders, clinical champions, and other important agency members.
                  </li>
                  <li>
                    Provide opportunities to receive input from staff at various  to promote a shared decision-making process.
                  </li>
                </ul>
              </li>
              <li>
                Additional resources about using principles of team science to promote a collaborative, successful implementation team can be found at <a href='http://www.teamscience.net/'>http://www.teamscience.net/</a>. Training modules and resources available include:
                <ul>
                  <li>
                    Assembling a multi-disciplinary team
                  </li>
                  <li>
                    Promoting team building
                  </li>
                  <li>
                    Managing a team with effective communication and leadership
                  </li>
                  <li>
                    Resolving potential conflict among team members
                  </li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </div>
	END

	puts p.title

	p=Page.create title: 'glossary', content: <<-END
		<center>
              <h1>Glossary</h1>
            </center>
          </div>
        </div>
        <div class='row'>
          <div class='col-md-8 col-md-offset-2 col-xs-10 col-xs-offset-1'>
            <p>
              The following terms are used throughout the text.
            </p>
            <table class='table'>
              <tbody>
                <tr id='facilitator'>
                  <td style='font-weight:bold;'>
                    ACT SMART Facilitator
                  </td>
                  <td>
                    The ACT SMART staff person who will be responsible for working with your agency implementation team. This includes, engaging agency staff to participate in the Agency Assessment and reflect on the findings, regularly meet with your agency implementation team to provide information about the ACT SMART toolkit, provide activity feedback, troubleshoot and guide implementation teams in the use of the ACT SMART toolkit.
                  </td>
                </tr>
                <tr id='phase'>
                  <td style='font-weight:bold;'>
                    ACT SMART Phase
                  </td>
                  <td>
                    ACT SMART has 4 phases, each with a specific goal of the phase. For example, Phase 1 focuses on identifying practice and delivery gaps and provides information about an agency's receptivity for change. Phase 2 focuses on selecting a research-based treatment and guiding implementation teams through adoption decisions. Phase 3 focuses on planning for treatment use. Finally, Phase 4 tracks the implementation use and evaluates the progress within the agency.
                  </td>
                </tr>
                <tr id='step'>
                  <td style='font-weight:bold;'>
                    ACT SMART Step
                  </td>
                  <td>
                    Each ACT SMART phase is comprised of several steps that guide implementation teams through specific activities necessary to accomplish the goal of the phase
                  </td>
                </tr>
                <tr id='activity'>
                  <td style='font-weight:bold;'>
                    ACT SMART Activity
                  </td>
                  <td>
                    Specific worksheets or activities to work through or consider in order to complete each ACT SMART step
                  </td>
                </tr>
                <tr id='adapt'>
                  <td style='font-weight:bold;'>
                    Adaptation
                  </td>
                  <td>
                    Planned changes to the design or delivery of a research-based treatment in the process of its adoption and implementation
                  </td>
                </tr>
                <tr id='assessment'>
                  <td style='font-weight:bold;'>
                    Agency Assessment
                  </td>
                  <td>
                    Survey completed by agency leaders, supervisors, and direct providers to identify areas of strength and growth related to the ASD services being delivered, the process of delivering ASD services, and the functioning of the agency
                  </td>
                </tr>
                <tr id='leaders'>
                  <td style='font-weight:bold;'>
                    Agency Leaders
                  </td>
                  <td>
                    An individual who has the role of director, CEO, or leading decision-maker regarding treatments used within an agency
                  </td>
                </tr>
                <tr id='value'>
                  <td style='font-weight:bold;'>
                    Clinical Value
                  </td>
                  <td>
                    How meaningful and important the benefits and outcomes achieved by the treatment are to your agency, service providers, and clients served
                  </td>
                </tr>
                <tr>
                  <td style='font-weight:bold;'>
                    Core Elements
                  </td>
                  <td>
                    Specific strategies or techniques of a research-based treatment that are responsible for a treatment’s effectiveness
                  </td>
                </tr>
                <tr>
                  <td style='font-weight:bold;'>
                    Direct Provider
                  </td>
                  <td>
                    Agency staff who deliver the intervention or treatment directly to children with ASD and their parents or caregivers.
                  </td>
                </tr>
                <tr id='effectiveness'>
                  <td style='font-weight:bold;'>
                    Effectiveness
                  </td>
                  <td>
                    How well the treatment performed under usual care conditions
                  </td>
                </tr>
                <tr id='efficacy'>
                  <td style='font-weight:bold;'>
                    Efficacy
                  </td>
                  <td>
                    How well the treatment performed under ideal conditions
                  </td>
                </tr>
                <tr>
                  <td style='font-weight:bold;'>
                    Feasibility
                  </td>
                  <td>
                    Ease of use; suitability for regular use as needed; practicability
                  </td>
                </tr>
                <tr>
                  <td style='font-weight:bold;'>
                    Fidelity
                  </td>
                  <td>
                    Delivery of a research-based treatment as intended; adherence; integrity; quality of program delivery
                  </td>
                </tr>
                <tr>
                  <td style='font-weight:bold;'>
                    Fit
                  </td>
                  <td>
                    Match or compatibility between research-based treatment and agency values, philosophy or mission.
                  </td>
                </tr>
                <tr>
                  <td style='font-weight:bold;'>
                    Implementation
                  </td>
                  <td>
                    The process of putting to use or integrating evidence-based practices within a specific setting (National Institutes of Health, 2011).
                  </td>
                </tr>
                <tr>
                  <td style='font-weight:bold;'>
                    Research-Based Treatment
                  </td>
                  <td>
                    Methods or strategies to treat clinical goals (or targets) that have studies that support their use for specific groups of individuals (such as children with ASD)
                  </td>
                </tr>
                <tr>
                  <td style='font-weight:bold;'>
                    Research Validity
                  </td>
                  <td>
                    The evidence-base supporting the use of the research-based treatment.
                  </td>
                </tr>
                <tr>
                  <td style='font-weight:bold;'>
                    Supervisor
                  </td>
                  <td>
                    Agency staff who oversee the direct intervention or treatment delivered to children with ASD by direct providers. Often supervisors are responsible for developing the programming or identifying the specific strategies or treatments for each child on his/her caseload.
                  </td>
                </tr>
                <tr>
                  <td style='font-weight:bold;'>
                    Sustainment
                  </td>
                  <td>
                    The capacity to deliver and/or core elements of an intervention is maintained (e.g., remain recognizable or delivered at a sufficient level of fidelity or intensity to yield desirable results) after initial implementation support has been withdrawn (Wiltsey Stirman et al., 2012).
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
	END

	puts p.title

	p=Page.create title: 'phase_3_step_3_activity_1_instructions', content: <<-END
		<ol class='breadcrumb'>
              <li>
                <a href="/dashboard">Dashboard</a>
              </li>
              <li>
                <a href="/phases/3">Phase 3</a>
              </li>
              <li>
                <a href="/phases/3/steps/8">Step 3</a>
              </li>
              <li>
                Activity 1 Instructions
              </li>
            </ol>
          </div>
        </div>
        <div class='row'>
          <div class='col-sm-12'>
            <h4>
              Instructions
            </h4>
            <p>
              1)	<b>Review treatment resources and assessment materials.</b> Use the treatment resources you have already gathered in phase 2 or see the
              <a href='TODO'>
                Instructions for Identifying and Selecting ASD Treatments
              </a>
              for guidance on how to access treatment resources. Review the treatment resources to determine if the treatment developer or others have suggested specific implementation and sustainment strategies.  Additionally, review the
              <a href='/phases/1'>
                Agency Assessment Feedback
              </a>
              for information about implementation supports currently being used by your agency. Additionally, look over recommendations of implementation and sustainment strategies that were provided as they may fit well with your agency’s climate and culture. Even if your agency is not currently using some of these strategies, they may match really well with your agency so that they are easier and more effective for your implementation plan.
            </p>
            <p>
              2)	<b>Select potential implementation and sustainment strategies from the Implementation and Sustainment strategies menu.</b> Place a check mark next to each specific strategy that will be considered for use at your agency. Again, these strategies will facilitate the implementation and sustainment of the research-based treatment.
            </p>
            <p>
              At this time in the planning process, it may be helpful to select all that that will be considered for use. Step 3 includes considerations that will assist with narrowing down the selection of implementation and sustainment strategies.
            </p>
            <div class='well' style='float:right;margin:1em;width:25%;'>
              <center>
                <b>Tip</b>
              </center>
              Your ACT SMART facilitator can provide assistance in selecting and planning for use of the implementation and sustainment strategies.
            </div>
            <p>
              3)	<b>Considerations for each strategy.</b> For each potential strategy that is being considered, select all of the strategy considerations that apply from the following list.
              <ul class='none'>
                <li>a.	<b>Use currently:</b> This strategy is currently being used within your agency with success.</li>
                <li>b.	<b>Previous success:</b> This strategy has been used in the past to successfully implement and/or sustain new treatments.</li>
                <li>c.	<b>Feasible:</b> This strategy will be feasible (compatible, practical) for use within your agency.</li>
                <li>d.	<b>Recommended by Agency Assessment:</b> This strategy was recommended by the ACT SMART team.</li>
              </ul>
            </p>
            <p>
              4) <b>Identify the most supported strategy or set of strategies.</b> Use the information gathered as you considered each strategy to determine which strategy or set of strategies will be most successful to support the initial implementation and sustained use of the research-based treatment.
            </p>
            <p>
              5)	<b>Plan for strategy use.</b> Once the specific strategy or set of strategies has been identified, detail how the strategy will be carried out. For instance, if you select Conduct local consensus discussions, this may be carried out by holding discussions at staff meetings to reach consensus on implementation decisions. Finally, specify who will carry out this plan.
            </p>
          </div>
        </div>
      </div>
	END

end

end


