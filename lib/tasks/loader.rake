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

			step2.activities.create seq: 1
			step2.activities.create seq: 2
			step2.activities.create seq: 3
			step2.activities.create seq: 4
			step2.activities.create seq: 5
			step2.activities.create seq: 6


		step3 = p2.steps.create seq: 3












		################################
		# Phase 3

		p3 = Phase.create name: 'phase_3', label: 'Phase 3', seq: 3
		puts p3.label




		################################
		# Phase 4

		p4 = Phase.create name: 'phase_4', label: 'Phase 4', seq: 4
		puts p4.label



		# a = Activity.create phase: 2, step: 2, num: 1, name: "Activity 1: Treatment Fit", content: <<-END
		# <p><u>Goal</u>: Assess whether the potential research-based treatment will be compatible with your agency’s values and mission.
		# </p>
		# <p>After selecting a potential treatment to adopt within your agency, it is important to evaluate the fit of the treatment with your agency’s values. The checklist below is designed to quickly think about the fit of the treatment that your agency is considering for implementation. Use the resources that helped you identify this research-based treatment to gather information about the treatment you are considering.
		# </p>
		# <h3>Evaluating Fit of the Treatment</h3>
		# END

		# puts a.name

		# questions = [
		# 	"Does this treatment fit with the value system of your agency?",
		# 	"Is this treatment likely to fit the need that was identified in the ACT SMART Agency Assessment?",
		# 	"Will this treatment fit with the philosophy of your agency?",
		# 	"Do you believe that staff and consumers feel/will feel that this treatment fits with the mission and aim of your agency?",
		# 	"Do you think that this treatment will be useful for your agency, staff, or clients?",
		# 	"Does the treatment fit with the culture of the clients served at your agency or the culture of the community?"		
		# ]

		

		# questions.each_with_index do |question, i|
		# 	q = a.questions.create seq: i+1, content: question
		# 	puts q.content
		# 	prompts.each do |prompt|
		# 		q.prompts.create content: prompt[:content], value: prompt[:value], seq: prompt[:seq]
		# 	end
		# end

		

		# a = Activity.create phase: 2, step: 2, num: 2, name: "Activity 2: Treatment Feasibility", content: <<-END
		# <p><u>Goal</u>: Assess whether the potential research-based treatment is easy for your providers to deliver.
		# </p>
		# <p>It is important to assess how easy or likely it would be for your staff to deliver the potential treatment. The worksheet below is designed to quickly think about the feasibility of the treatment that your agency is considering for implementation. Use the resources that helped you identify this research-based treatment to gather information about the treatment you are considering. 
		# </p>
		# <h3>Evaluating the Feasibility of the Treatment</h3>
		# END
		# puts a.name

		# questions = [
		# 	"Will it be possible to provide this treatment in the setting that you typically deliver services (home, clinic, school, etc.)?",
		# 	"Does your agency have the staff, materials, space, and other necessities to deliver this treatment?",
		# 	"Will this treatment be able to be delivered within your agency without modification?",
		# 	"Will this treatment be used daily by multiple staff?",
		# 	"Can components of this treatment be tried out to evaluate its utility or suitability?",
		# 	"Is the treatment administratively feasible, given the policies and procedures of your agency?"		
		# ]

		# questions.each_with_index do |question, i|
		# 	q = a.questions.create seq: i+1, content: question
		# 	puts q.content
		# 	prompts.each do |prompt|
		# 		q.prompts.create content: prompt[:content], value: prompt[:value], seq: prompt[:seq]
		# 	end
		# end



	end

end


