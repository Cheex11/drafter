class Draft < ActiveRecord::Base

	has_many :teams

	def start
		@players = []
		@order = []
		@teams = []
		@rounds = 16

		self.set_teams()
		self.set_players()

		self.set_order()

	end

	def set_order()
		@rounds.times do |number|
			if number.even?
				@teams.each do |team|
					@order << team
				end
			end

			if number.odd?
				@teams.reverse.each do |team|
					@order << team
				end
			end
		end
	end

	def order
		@order
	end

	def rounds
		@rounds
	end


	def set_teams()

		Team.where(draft_id: 0).each do |team|
			new_team = Team.create(:team_name => team.team_name, :draft_position => team.draft_position, :draft_id => self.id)
			@teams << new_team
		end

		@teams
	end

	def set_players()
		Player.all.each do |player|
			@players << player
		end
	end

	def order
		@order
	end

	def teams
		@teams
	end

	def team_picks(team)
		@picks = []

		@order.each_with_index do |pick, index|
			if pick == team
				@picks << index
			end
		end

		@picks
	end

	def players
		@players
	end

	def best_available

		best_players_available = []

		@players.each do |player|
			if self.ranking_method == 'beer_value'
				best_players_available = @players.sort { |b,a| a.beer_value <=> b.beer_value }
			end
		end

		return best_players_available[0], best_players_available[1], best_players_available[2]

	end
end
