namespace :patch do

	task load: :environment do
		act = Phase.find( 2 ).steps.find_by( seq: 3 ).activities.find_by( seq: 1 )
		puts 'adding extra questions'

		q = act.questions.create seq: 1, name: 'fit_feasibility_importance'
		puts "added fit_feasibility_importance"
		q = act.questions.create seq: 2, name: 'value_utility_importance'
		puts "added value_utility_importance"
		q = act.questions.create seq: 3, name: 'training_importance'
		puts "added training_importance"
		q = act.questions.create seq: 4, name: 'benefit_cost_importance'
		puts "added benefit_cost_importance"
		q = act.questions.create seq: 5, name: 'funding_importance'
		puts "added funding_importance"

		q = act.questions.create seq: 6, name: 'final_adoption_desision'
		puts "added final_adoption_desision"
		
	end

end