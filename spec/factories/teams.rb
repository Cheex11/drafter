# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :team do
		team_name 'team_one'
    draft_position 1

  	factory :team_two do
			team_name 'team_two'
	    draft_position 2
	  end
	end
end
