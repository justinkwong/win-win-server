json.survey do 
	json.id @survey.id
	json.name @survey.name
	json.questions @survey.questions do |q|
		json.id q.id
		json.prompt q.prompt
		json.category q.category
		json.multiple_choice do				
			m = q.multiple_choice
			if m != nil
				json.id m.id
				json.choice1 m.choice1
				json.choice2 m.choice2
				json.choice3 m.choice3
				json.choice4 m.choice4
				json.choice5 m.choice5
			end
		end
	end
end