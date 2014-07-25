class Draft < ActiveRecord::Base

	has_many :teams
	has_many :picks
	has_many :players, through: :picks

	validates :draft_position, :presence => true
	validates :number_of_teams, :presence => true
	validates :PPTD, :presence => true
	validates :PPR, :presence => true
	validates :Number_of_starting_QBs, :presence => true
	validates :Number_of_starting_HBs, :presence => true
	validates :Number_of_starting_WRs, :presence => true
	validates :Number_of_starting_FLEX, :presence => true
	validates :draft_type, :presence => true
	validates :keeper, :presence => true
	validates :ranking_method, :presence => true
	validates :rounds, :presence => true
	validates :current_pick, :presence => true

	after_save :set_teams

	def set_teams
		Team.where(master: true).each do |team|
			if team.draft_position <= self.number_of_teams
				Team.create(:team_name => team.team_name, :draft_position => team.draft_position, :draft_id => self.id, :master => false)
			end
		end
	end

	def team_at(pick)
		return self.set_order[pick - 1]
	end

	# def team_at(pick)
	# 	if current_('round').even?
	# 		self.teams.reverse_each do |team|
	# 			if team.draft_position == snake_pick(team)
	# 				return team
	# 			end
	# 		end
	# 	else
	# 		self.teams.each do |team|
	# 			if team.draft_position == current('pick')
	# 				return team
	# 			end
	# 		end
	# 	end
	# end

	def teams
		teams = []
		Team.all.each do |team|
			if team.draft_id == self.id
				teams << team
			end
		end
		teams
	end

	def available_players
		@drafted_players = self.drafted_players
		@available_players = []

		Player.all.each do |player|
			if drafted_players.index(player) == nil
				@available_players << player
			end
		end
			@available_players
	end

	def drafted_players
		@drafted_players = []
		Pick.all.each do |pick|
			if pick.draft_id == self.id
				@drafted_players << pick.player
			end
		end
		@drafted_players
	end

	def set_order
		@order = []
		self.rounds.times do |number|
			if number.even?
				self.teams.each do |team|
					@order << team
				end
			end

			if number.odd?
				self.teams.reverse.each do |team|
					@order << team
				end
			end
		end
		@order
	end

	def updraft
		self.current_pick += 1
	end

  def best_available
    best_players_available = []

    if self.ranking_method == 'beer_value'
      best_players_available = self.available_players.sort { |b,a| a.beer_value <=> b.beer_value }
    end

    return best_players_available[0], best_players_available[1], best_players_available[2]
  end

  def current_(round_or_pick)
		results = self.current_pick.divmod(self.number_of_teams)

		current_round = results[0]
		current_pick = results[1]

		if round_or_pick == 'round'
			if current_pick == 0
				current_round
			else
				current_round + 1
			end
		else
			if current_pick == 0
				self.number_of_teams
			else
				current_pick
			end
		end
  end

end
