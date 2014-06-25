require 'rails_helper'

RSpec.describe Draft, :type => :model do

	describe 'initialize' do
		it 'should initialize with an array for player one' do
			draft = Draft.create(12, "snake")
			draft.teams.length.should eq 12
		end

		it 'should initialize with a draft type (snake or auction)' do
			draft = Draft.create(2, "snake")
			draft.type.should eq "snake"
		end

		it 'should initialize each team with a unique team name and number' do
			draft = Draft.create(2, "snake")
			draft.teams[1].team_name.should eq "Team 2"
		end
	end

	describe 'start' do

		# it 'creates the draft order if the draft type is snake' do
		# 	draft = Draft.create(8, 'snake')
		# 	draft.start()
		# 	draft.order.index(draft.teams[0]).should eq [0,15,16,31,32,47,48,63,64,79,80,95,96,111,112,127]
		# end
	end
end
