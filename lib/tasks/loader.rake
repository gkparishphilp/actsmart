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
		act = step2.activities.create seq: 5
		act = step2.activities.create seq: 6


		step3 = p2.steps.create seq: 3












		################################
		# Phase 3

		p3 = Phase.create name: 'phase_3', label: 'Phase 3', seq: 3
		puts p3.label




		################################
		# Phase 4

		p4 = Phase.create name: 'phase_4', label: 'Phase 4', seq: 4
		puts p4.label






	end

end


