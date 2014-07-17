require 'rails_helper'

RSpec.describe Pick, :type => :model do
  it { should belong_to(:player) }
  it { should belong_to(:team) }
  it { should belong_to(:draft) }

  it { should validate_presence_of :draft_id}
  it { should validate_presence_of :player_id}
  it { should validate_presence_of :team_id}
  it { should validate_presence_of :draft_position}

  describe 'create' do
  	it 'should be created with the correct draft ID' do
  		draft = FactoryGirl.create(:two_team_draft)
  		team1 = FactoryGirl.create(:team)
  		team2 = FactoryGirl.create(:team_two)
  		cam = FactoryGirl.create(:player)
  		reggie = FactoryGirl.create(:reggie_bush)
  		draft.start()
  		pick = Pick.create(:player_id => cam.id, :team_id => draft.order[0].id, :draft_id => draft.id, :draft_position => draft.current_pick)
  		pick.draft_id.should eq draft.id
  	end

  	it 'should be created with the correct player ID' do
	  	draft = FactoryGirl.create(:two_team_draft)
	  	team1 = FactoryGirl.create(:team)
	  	team2 = FactoryGirl.create(:team_two)
	  	cam = FactoryGirl.create(:player)
	  	reggie = FactoryGirl.create(:reggie_bush)
	  	draft.start()
	  	pick = Pick.create(:player_id => cam.id, :team_id => draft.order[0].id, :draft_id => draft.id, :draft_position => draft.current_pick)
	  	pick.player_id.should eq cam.id
	  end

	  it 'should be created with the correct team ID' do
	  	draft = FactoryGirl.create(:two_team_draft)
	  	team1 = FactoryGirl.create(:team)
	  	team2 = FactoryGirl.create(:team_two)
	  	cam = FactoryGirl.create(:player)
	  	reggie = FactoryGirl.create(:reggie_bush)
	  	draft.start()
	  	pick = Pick.create(:player_id => cam.id, :team_id => draft.order[0].id, :draft_id => draft.id, :draft_position => draft.current_pick)
	  	pick.team_id.should eq draft.teams[0].id
		end
	end

	describe 'player_object' do
		it 'should return the player object of the player being picked' do
			draft = FactoryGirl.create(:two_team_draft)
			team1 = FactoryGirl.create(:team)
			team2 = FactoryGirl.create(:team_two)
			cam = FactoryGirl.create(:player)
			reggie = FactoryGirl.create(:reggie_bush)
			draft.start()
			pick = Pick.create(:player_id => cam.id, :team_id => draft.order[0].id, :draft_id => draft.id, :draft_position => draft.current_pick)
			pick.player_object.should eq cam
		end
	end

	describe 'draft_object' do
		it 'should move the player from available to drafted in a given draft' do
			draft = FactoryGirl.create(:draft)
			team1 = FactoryGirl.create(:team)
			team2 = FactoryGirl.create(:team_two)
			cam = FactoryGirl.create(:player)
			reggie = FactoryGirl.create(:reggie_bush)
			draft.start()
			pick = Pick.create(:player_id => cam.id, :team_id => draft.order[0].id, :draft_id => draft.id, :draft_position => draft.current_pick)
			pick.draft_object.should eq draft
		end
	end

	describe 'run' do
		it 'should run run when created' do
			draft = FactoryGirl.create(:draft)
			team1 = FactoryGirl.create(:team)
			team2 = FactoryGirl.create(:team_two)
			cam = FactoryGirl.create(:player)
			reggie = FactoryGirl.create(:reggie_bush)
			draft.start()
			pick = Pick.create(:player_id => cam.id, :team_id => draft.order[0].id, :draft_id => draft.id, :draft_position => draft.current_pick)
			pick.draft_object.should eq draft
		end
	end


	describe 'draft_type' do
		it 'should tell the type of draft' do
			draft = FactoryGirl.create(:draft)
			team1 = FactoryGirl.create(:team)
			team2 = FactoryGirl.create(:team_two)
			cam = FactoryGirl.create(:player)
			reggie = FactoryGirl.create(:reggie_bush)
			draft.start()
			pick = Pick.create(:player_id => cam.id, :team_id => draft.order[0].id, :draft_id => draft.id, :draft_position => draft.current_pick)
			pick.draft_type.should eq draft.draft_type
		end
	end

	describe 'available_players' do
		it 'should tell the avilable players in the draft' do
			draft = FactoryGirl.create(:draft)
			team1 = FactoryGirl.create(:team)
			team2 = FactoryGirl.create(:team_two)
			cam = FactoryGirl.create(:player)
			reggie = FactoryGirl.create(:reggie_bush)
			draft.start()
			pick = Pick.create(:player_id => cam.id, :team_id => draft.order[0].id, :draft_id => draft.id, :draft_position => draft.current_pick)
			print draft.available_players
			pick.available_players.should eq [reggie]
		end
	end
end
