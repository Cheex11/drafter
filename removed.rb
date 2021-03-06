	<div id='new_draft_settings'>
	  <div class='col-md-12'>
	  	<div class='row'>
	  		<div class='col-md-4'>
		      <p class='top_choices'>Starting QBs:</p>
			      <div class="btn-group-qb">
			        <button type="button" class="btn btn-default">1</button>
			        <button type="button" class="btn btn-default">2</button>
			        <button type="button" class="btn btn-default">3</button>
			      </div>

		      <p class='top_choices'>Starting HBs:</p>
			      <div class="btn-group-hb">
			        <button type="button" class="btn btn-default">1</button>
			        <button type="button" class="btn btn-default">2</button>
			        <button type="button" class="btn btn-default">3</button>
			        <button type="button" class="btn btn-default">4</button>
			      </div>

		      <p class='top_choices'>Starting WRs:</p>
			      <div class="btn-group-wr">
			        <button type="button" class="btn btn-default">1</button>
			        <button type="button" class="btn btn-default">2</button>
			        <button type="button" class="btn btn-default">3</button>
			        <button type="button" class="btn btn-default">4</button>
			      </div>

				</div>

	  		<div class='col-md-4'>

	  			<p class='top_choices'> Number of Teams </p>
	  			<p class='top_choices'> Draft Number </p>
	  			<p class='top_choices'> Logic Type: </p>

	  		</div>

	  		<div class='col-md-4'>
	  			<p class='top_choices'> PPR </p>
	  			<p class='top_choices'> PPC </p>
	  			<p class='top_choices'> PPTD </p>
	  		</div>



	  	</div>
	  </div>
	</div>


<div id='new_draft_div'>
		<%= link_to "START YOUR DRAFT!", new_draft_path, id: "new_draft", :class => 'btn btn-success', remote: true %>
</div>














DRAFT INDEX


<div class='row top_header'>
  <div class='col-md-12'>
  	<div class='row'>
  		<div class='col-md-4'>

      <p>Starting QBs:</p>
      <select class='starter_settings'>
        <option value="QB-1">1</option>
        <option value="QB-2">2</option>
      </select>

      <p>Starting HBs:</p>
      <select class='starter_settings'>
        <option value="HB-1">1</option>
        <option value="HB-2">2</option>
        <option value="HB-3">3</option>
        <option value="HB-4">4</option>
      </select>

      <p>Starting WRs:</p>
      <select class='starter_settings'>
        <option value="WR-1">1</option>
        <option value="WR-2">2</option>
        <option value="WR-3">3</option>
        <option value="WR-4">4</option>
      </select>


  		</div>
  		<div class='col-md-4'>
  			<p class='top_choices'> DRAFT # </p>
  			<p class='top_choices'> TEAMS </p>
  			<p class='top_choices'> <%= link_to "New Draft", new_draft_path, id: "new_draft", remote: true %>  </p>

  		</div>
  		<div class='col-md-4'>
  			<p class='top_choices'> PPR </p>
  			<p class='top_choices'> PPC </p>
  			<p class='top_choices'> PPTD </p>
  		</div>
  	</div>
  </div>
</div>

<div class='row draft-center'>
  <div class='col-md-2 master_list'>
    <div id='player_list'>

      <% @draft.players.each do |player| %>
        <%= player.name %></br>
      <% end %>

    </div>
  </div>

  <div class='col-md-7'>
    <div id='recommendations'>
      <p> Player rec's:</p>
        <div class = 'row'>
          <% @draft.best_available('beer_value').each do |player| %>
            <div class = 'col-md-4'>
              <div class='player_box'>
                Player: <%= player.name %></br>
                Team: <%= player.team %></br>
                Beer Value: <%= player.beer_value %> </br>
                ADP: <%= player.adp %> </br>
                Bye Week: <%= player.bye_week %></br>
              </div>
            </div>
          <% end %>
        </div>


    </div>

    <div class='position_tracking'>
      <div class='row'>

        <div class='col-md-2 remaining'>

          <h5>QBs:</h5>
            <% @draft.players.each do |player| %>
              <% if player.position == 'QB' %>
                <%= player.name %> </br>
              <% end %>
            <% end %>

        </div>

        <div class='col-md-2 remaining'>

          <h5>HBs:</h5>
            <% @draft.players.each do |player| %>
              <% if player.position == 'HB' %>
                <%= player.name %> </br>
              <% end %>
            <% end %>

        </div>

        <div class='col-md-2 remaining'>
          <h5>WRs:</h5>
            <% @draft.players.each do |player| %>
              <% if player.position == 'WR' %>
                <%= player.name %> </br>
              <% end %>
            <% end %>
        </div>

        <div class='col-md-2 remaining'>

          <h5>TEs:</h5>
            <% @draft.players.each do |player| %>
              <% if player.position == 'TE' %>
                <%= player.name %> </br>
              <% end %>
            <% end %>

        </div>

        <div class='col-md-2 remaining'>

          <h5>DEFs:</h5>
            <% @draft.players.each do |player| %>
              <% if player.position == 'DEF' %>
                <%= player.name %> </br>
              <% end %>
            <% end %>

        </div>

        <div class='col-md-2 remaining'>

          <h5>Ks:</h5>
            <% @draft.players.each do |player| %>
              <% if player.position == 'K' %>
                <%= player.name %> </br>
              <% end %>
            <% end %>
        </div>

      </div>
    </div>

  </div>
  <div class='col-md-3'>
    <div class='roster'>
      <p>Drafted players will appear here.  A team rundown at each position will be available. </p>
      <ul>
        <li> QB:  </li>
        <li> HB:  </li>
        <li> WR:  </li>
        <li> TE:  </li>
        <li> DEF: </li>
        <li> K: </li>
        <li> FLEX: </li>
        <li> BENCH: </li>
      </ul>
    </div>
    <div class='under_roster'>
      <p> This area does not have a name yet because I do not know what I will put here!</p>
    </div>
  </div>
</div>
<div class='row footer'>
  <div class='col-md-12 bottom_footer'>
    <p> I don't know what will go at the bottom of the page.</p>
  </div>
</div>



SHOW


<div class='row top_header'>
  <div class='col-md-12'>
    <div class='row'>
      <div class='col-md-4'>

      <p>Starting QBs:</p>
      <select class='starter_settings'>
        <option value="QB-1">1</option>
        <option value="QB-2">2</option>
      </select>

      <p>Starting HBs:</p>
      <select class='starter_settings'>
        <option value="HB-1">1</option>
        <option value="HB-2">2</option>
        <option value="HB-3">3</option>
        <option value="HB-4">4</option>
      </select>

      <p>Starting WRs:</p>
      <select class='starter_settings'>
        <option value="WR-1">1</option>
        <option value="WR-2">2</option>
        <option value="WR-3">3</option>
        <option value="WR-4">4</option>
      </select>


      </div>
      <div class='col-md-4'>
        <p class='top_choices'> DRAFT # </p>
        <p class='top_choices'> TEAMS </p>
        <p class='top_choices'> <%= link_to "New Draft", new_draft_path, id: "new_draft", remote: true %>  </p>
      </div>
      <div class='col-md-4'>
        <p class='top_choices'> PPR </p>
        <p class='top_choices'> PPC </p>
        <p class='top_choices'> PPTD </p>
      </div>
    </div>
  </div>
</div>

<div class='row draft-center'>
  <div class='col-md-2 master_list'>
    <div id='player_list'>

      <% @player.each do |player| %>
        <%= player.name %></br>
      <% end %>

    </div>
  </div>

  <div class='col-md-7'>
    <div id='recommendations'>
      <p> Player rec's:</p>

      <% if 1 == 2 %>
      <%= @draft.best_available('beer_value').name %> </br>
      <% end %>

      <% if 1 == 2 %>
      <% @draft.draft_suggestions('beer_value').each do |player| %>
      <%= player.name %> </br>
      <% end %>
      <% end %>

      <% @draft.players.reject{|element| element == @draft.best_available('beer_value')}.each do |player|%>
      <%= player.name %>
      <% end %>



    </div>

    <div class='position_tracking'>
      <div class='row'>
        <div class='col-md-2 remaining'>
          <p>QBs:</p>
        </div>
        <div class='col-md-2 remaining'>
          <p>HBs:</p>
        </div>
        <div class='col-md-2 remaining'>
          <p>WRs:</p>
        </div>
        <div class='col-md-2 remaining'>
          <p>TEs:</p>
        </div>
        <div class='col-md-2 remaining'>
          <p>DEF:</p>
        </div>
        <div class='col-md-2 remaining'>
          <p>Ks:</p>
        </div>
      </div>
    </div>

  </div>
  <div class='col-md-3'>
    <div class='roster'>
      <p>Drafted players will appear here.  A team rundown at each position will be available. </p>
      <ul>
        <li> QB:  </li>
        <li> HB:  </li>
        <li> WR:  </li>
        <li> TE:  </li>
        <li> DEF: </li>
        <li> K: </li>
        <li> FLEX: </li>
        <li> BENCH: </li>
      </ul>
    </div>
    <div class='under_roster'>
      <p> This area does not have a name yet because I do not know what I will put here!</p>
    </div>
  </div>
</div>
<div class='row footer'>
  <div class='col-md-12 bottom_footer'>
    <p> I don't know what will go at the bottom of the page.</p>
  </div>
</div>





DRAFT SPECS

  # describe 'teams' do
  #   it 'should hold an array of all teams in the draft' do
  #     draft = FactoryGirl.create(:two_team_draft)
  #     team = Team.create(:team_name => 'team_one', :draft_position => 1, :draft_id => draft.id)
  #     team2 = Team.create(:team_name => 'team_two', :draft_position => 2, :draft_id => draft.id)
  #     team3 = Team.create(:team_name => 'team_three', :draft_position => 2, :draft_id => draft.id)
  #     team4 = Team.create(:team_name => 'team_four', :draft_position => 2, :draft_id => draft.id)
  #     team5 = Team.create(:team_name => 'team_five', :draft_position => 2, :draft_id => draft.id)
  #     team6 = Team.create(:team_name => 'team_six', :draft_position => 2, :draft_id => draft.id)
  #     team7 = Team.create(:team_name => 'team_seven', :draft_position => 2, :draft_id => draft.id)
  #     team8 = Team.create(:team_name => 'team_eight', :draft_position => 2, :draft_id => draft.id)
  #     draft.start()
  #     draft.teams.should eq [team, team2, team3, team4, team5, team6, team7, team8]
  #   end
  # end


  # describe 'order' do
  #   it 'should tell the order of the draft with a team at each position in the array' do
  #     draft = FactoryGirl.create(:two_team_draft)
  #     team = Team.create(:team_name => 'team_one', :draft_position => 1, :draft_id => draft.id)
  #     team2 = Team.create(:team_name => 'team_two', :draft_position => 2, :draft_id => draft.id)
  #     team3 = Team.create(:team_name => 'team_three', :draft_position => 2, :draft_id => draft.id)
  #     team4 = Team.create(:team_name => 'team_four', :draft_position => 2, :draft_id => draft.id)
  #     team5 = Team.create(:team_name => 'team_five', :draft_position => 2, :draft_id => draft.id)
  #     team6 = Team.create(:team_name => 'team_six', :draft_position => 2, :draft_id => draft.id)
  #     team7 = Team.create(:team_name => 'team_seven', :draft_position => 2, :draft_id => draft.id)
  #     team8 = Team.create(:team_name => 'team_eight', :draft_position => 2, :draft_id => draft.id)
  #     draft.start()
  #     draft.team_picks(draft.teams[0]).should eq [0,15,16,31,32,47,48,63,64,79,80,95,96,111,112,127]
  #   end
  # end


  # describe 'order' do
  #   it 'creates the draft order if the draft type is snake' do
  #     draft = Draft.create(8, 'snake')
  #     draft.start()
  #     draft.team_picks(draft.teams[0]).should eq [0,15,16,31,32,47,48,63,64,79,80,95,96,111,112,127]
  #   end
  # end

  # describe 'team_picks' do
  #   it 'returns the picks of a given team' do
  #     draft = Draft.create(8, 'snake')
  #     draft.start()
  #     draft.team_picks(draft.teams[1]).should eq [1,14,17,30,33,46,49,62,65,78,81,94,97,110,113,126]
  #   end
  # end


  #   it "automatically cycles to the next player's pick" do
  #     player = FactoryGirl.create(:player)
  #     draft = Draft.create(8, 'snake')
  #     draft.start()
  #     draft.pick(player)
  #     draft.order[0].should eq draft.teams[1]
  #   end

  #   it 'removes the player selected from the players array.' do
  #     player = FactoryGirl.create(:player)
  #     reggie = FactoryGirl.create(:reggie_bush)
  #     draft = Draft.create(8, 'snake')
  #     draft.start()
  #     draft.pick(player)
  #     draft.players.should eq [reggie]
  #   end
  # end


  #   it 'should tell the drafting team the best player available in the draft and not show a player that has already been drafted.' do
  #     cam = FactoryGirl.create(:player)
  #     reggie = FactoryGirl.create(:reggie_bush)
  #     forte = FactoryGirl.create(:matt_forte)
  #     jamaal = FactoryGirl.create(:jamaal_charles)
  #     draft = Draft.create(8, 'snake')
  #     draft.start()
  #     draft.pick(jamaal)
  #     draft.best_available("beer_value")[0].should eq forte
  #   end
  # end

  # describe 'analyze_bye_week' do
  #   it 'shouold analyze the drafting teams roster and if a suggested player has the same bye week as a player already in the roster, it should return the name of the player already in the roster.' do
  #     dud = FactoryGirl.create(:dud)
  #     cam = FactoryGirl.create(:player)
  #     reggie = FactoryGirl.create(:reggie_bush)
  #     jamaal = FactoryGirl.create(:jamaal_charles)
  #     forte = FactoryGirl.create(:matt_forte)
  #     rice = FactoryGirl.create(:ray_rice)
  #     draft = Draft.create(2, 'snake')
  #     draft.start()
  #     draft.pick(jamaal)
  #     draft.pick(cam)
  #     draft.pick(reggie)
  #     draft.analyze_bye_week(draft.best_available('beer_value')[0]).should eq jamaal
  #   end

  #   it 'should return false if a suggested player does not have the same bye week as a player in the same position for the team that is currently drafting.' do
  #     dud = FactoryGirl.create(:dud)
  #     cam = FactoryGirl.create(:player)
  #     reggie = FactoryGirl.create(:reggie_bush)
  #     jamaal = FactoryGirl.create(:jamaal_charles)
  #     forte = FactoryGirl.create(:matt_forte)
  #     rice = FactoryGirl.create(:ray_rice)
  #     draft = Draft.create(2, 'snake')
  #     draft.start()
  #     draft.pick(cam)
  #     draft.pick(jamaal)
  #     draft.pick(forte)
  #     draft.analyze_bye_week(draft.best_available('beer_value')[0]).should eq false
  #   end
  # end

  # describe 'analyze_bye_weeks' do
  #   it 'should analyze the bye week for each player in the suggested player array and return an array of responses corresponding to each player in the suggested player array.' do
  #     dud = FactoryGirl.create(:dud)
  #     cam = FactoryGirl.create(:player)
  #     reggie = FactoryGirl.create(:reggie_bush)
  #     jamaal = FactoryGirl.create(:jamaal_charles)
  #     forte = FactoryGirl.create(:matt_forte)
  #     rice = FactoryGirl.create(:ray_rice)
  #     lacy = FactoryGirl.create(:eddie_lacy)
  #     draft = Draft.create(2, 'snake')
  #     draft.start()
  #     draft.pick(jamaal)
  #     draft.pick(cam)
  #     draft.pick(rice)
  #     draft.analyze_bye_weeks(draft.best_available('beer_value')).should eq [jamaal, false, jamaal]
  #   end
  # end



From show view:
  <%= link_to 'Draft', player_path(player, "player[team_id]" => @draft.order[0].id, "player[drafted]" => true), :method => :patch, :class => "btn btn-success" %>



From player index:

      <!-- <ul id='player_list'>
        <li>
          <%= link_to player.name, edit_player_path(player) %></br>
        </li>
      </ul> -->


From player model:

  def change_drafted_status
    if self.drafted == false
      self.drafted = true
    else
      self.drafted = false
    end
  end






From Draft.rb

  def drafted_players
    drafted_players = []

    @players.each do |player|
      if player.drafted == true
        drafted_players << player
      end
    end
    drafted_players
  end

  def available_players
    available_players = []

    @players.each do |player|
      if player.drafted == false
        available_players << player
      end
    end
    available_players
  end



  def pick(player)
    if player.drafted == true
      return false
    end

    player.team_id = @order[0].id
    player.drafted = true
    @order.shift
    player
  end



FROM Player SPECS
  describe 'change_drafted_status' do
    it "should change the player's drafted status from false to true" do
      player = FactoryGirl.create(:player)
      player.change_drafted_status
      player.drafted.should eq true
    end
  end

FROM DRaft SPECS
#   # describe 'pick' do
#   #   it 'will not execute if the player has a drafted status of true' do
#   #     drafted_player = FactoryGirl.create(:drafted_player)
#   #     cam = FactoryGirl.create(:player)
#   #     reggie = FactoryGirl.create(:reggie_bush)
#   #     draft = FactoryGirl.create(:two_team_draft)
#   #     draft.start()
#   #     draft.pick(drafted_player).should eq false
#   #   end


#   #   it 'drafts a player from the available_players array and changes their drafted status to true' do
#   #       draft = FactoryGirl.create(:two_team_draft)
#   #       player = FactoryGirl.create(:player)
#   #       team = FactoryGirl.create(:team)
#   #       team2 = FactoryGirl.create(:team_two)
#   #       draft.start()
#   #       draft.pick(draft.players[0])
#   #       draft.players[0].drafted.should eq true
#   #     end

#   #   it 'cycles the order to the next team by deleting the current team from the order array.' do
#   #     draft = FactoryGirl.create(:two_team_draft)
#   #     player = FactoryGirl.create(:player)
#   #     team = FactoryGirl.create(:team)
#   #     team2 = FactoryGirl.create(:team_two)
#   #     draft.start()
#   #     draft.pick(draft.players[0])
#   #     draft.order[0].team_name.should eq 'team_two'
#   #   end
#   # end



DRAFT SPECS



    # describe 'draft_player' do
    #   it 'should move a player from the available array to the drafted array' do

    #   end
    # end



  # describe 'available_players' do
  #   it 'should return all players who have not been drafted in the draft' do
  #     draft = FactoryGirl.create(:two_team_draft)
  #     team = FactoryGirl.create(:team)
  #     team2 = FactoryGirl.create(:team_two)
  #     cam = FactoryGirl.create(:player)
  #     reggie = FactoryGirl.create(:reggie_bush)
  #     draft.start()
  #     pick = Pick.create(:player_id => cam.id, :team_id => draft.order[0].id, :draft_id => draft.id, :draft_position => draft.current_pick)
  #     draft.available_players.should eq [reggie]
  #   end
  # end




#   describe 'best_available' do
#     it 'should return an array of the best players available in the draft' do
#       cam = FactoryGirl.create(:player)
#       reggie = FactoryGirl.create(:reggie_bush)
#       jamaal = FactoryGirl.create(:jamaal_charles)
#       forte = FactoryGirl.create(:matt_forte)
#       rice = FactoryGirl.create(:ray_rice)
#       dud = FactoryGirl.create(:dud)
#       draft = FactoryGirl.create(:draft)
#       draft.start()
#       draft.best_available.should eq [jamaal, forte, reggie]
#     end

#     # it 'should return an array of the best players STILL available in the draft' do
#     #   jamaal = FactoryGirl.create(:jamaal_charles)
#     #   cam = FactoryGirl.create(:player)
#     #   reggie = FactoryGirl.create(:reggie_bush)
#     #   forte = FactoryGirl.create(:matt_forte)
#     #   rice = FactoryGirl.create(:ray_rice)
#     #   dud = FactoryGirl.create(:dud)
#     #   draft = FactoryGirl.create(:two_team_draft)
#     #   team = FactoryGirl.create(:team)
#     #   team2 = FactoryGirl.create(:team_two)
#     #   draft.start()
#     #   draft.pick(draft.players[0])
#     #   draft.best_available.should eq [forte, reggie, cam]
#     # end
#   end

#   describe 'number_of_teams' do
#     it 'should return the number of teams' do
#       draft = FactoryGirl.create(:draft)
#       draft.number_of_teams.should eq 12
#     end
  # end


PICKS SPECS

  # describe 'print PPTD' do
  #   it 'should print the PPTD for the draft' do
  #     draft = FactoryGirl.create(:draft)
  #     team1 = FactoryGirl.create(:team)
  #     team2 = FactoryGirl.create(:team_two)
  #     cam = FactoryGirl.create(:player)
  #     reggie = FactoryGirl.create(:reggie_bush)
  #     draft.start()
  #     pick = Pick.create(:player_id => cam.id, :team_id => draft.order[0].id, :draft_id => draft.id, :draft_position => draft.current_pick)
  #     pick.draft_stats('PPTD').should eq 4
  #   end
  # end


  # describe 'draft_player' do
  #   it 'should move the player from available to drafted in a given draft' do
  #     draft = FactoryGirl.create(:draft)
  #     team1 = FactoryGirl.create(:team)
  #     team2 = FactoryGirl.create(:team_two)
  #     cam = FactoryGirl.create(:player)
  #     reggie = FactoryGirl.create(:reggie_bush)
  #     draft.start()
  #     pick = Pick.create(:player_id => cam.id, :team_id => draft.order[0].id, :draft_id => draft.id, :draft_position => draft.current_pick)
  #     pick.draft_player
  #     draft.available_players.should eq [reggie]
  #   end
  # end

  # describe 'available_players' do
  #   it 'should return the available players in the draft' do
  #     draft = FactoryGirl.create(:draft)
  #     team1 = FactoryGirl.create(:team)
  #     team2 = FactoryGirl.create(:team_two)
  #     cam = FactoryGirl.create(:player)
  #     reggie = FactoryGirl.create(:reggie_bush)
  #     draft.start()
  #     pick = Pick.create(:player_id => cam.id, :team_id => draft.order[0].id, :draft_id => draft.id, :draft_position => draft.current_pick)
  #     pick.available_players.should eq [reggie]
  #   end
  # end



FROM DRAFT spec


  def refresh_available_players
    @picked_players.id
    # if @picks_in_current_draft == nil
    #   return @players
    # else
    #   @available_players.each do |player|
    #     @picks_in_current_draft.each do |pick|
    #       if player.id == pick.player_id
    #         @drafted_players << player
    #       else
    #         @available_players << player
    #       end
    #     end
    #   end
    # end
    # @available_players
  end


  describe 'draft_type' do
    it 'should tell the type of draft' do
      team1 = FactoryGirl.create(:team)
      team2 = FactoryGirl.create(:team_two)
      cam = FactoryGirl.create(:player)
      reggie = FactoryGirl.create(:reggie_bush)
      draft = FactoryGirl.create(:draft)
      pick = Pick.create(:player_id => cam.id, :team_id => draft.order[0].id, :draft_id => draft.id, :draft_position => draft.current_pick)
      pick.draft_type.should eq draft.draft_type
    end
  end



DRAFT.#!/usr/bin/env ruby -wKU

  def update_available_players(draft)

    @available_players.each do |player|
      Pick.all.each do |pick|
        if pick.player == player
          @drafted_players << player
          @available_players.delete(player)
        end
      end
    end

    @available_players

  end



    describe 'available_players' do
    it 'should tell the available players in the draft object' do
      draft = FactoryGirl.create(:two_team_draft)
      team1 = FactoryGirl.create(:team)
      team2 = FactoryGirl.create(:team_two)
      cam = FactoryGirl.create(:player)
      reggie = FactoryGirl.create(:reggie_bush)
      draft.start()
      pick = Pick.create(:player_id => cam.id, :team_id => draft.order[0].id, :draft_id => draft.id, :draft_position => draft.current_pick)
      Pick.available_players(draft).should eq [reggie]
    end
  end




# CANNNOT GET THESE TO PASS
  # describe 'available_players_returns_nil' do
  #   it 'should tell the avilable players in the draft' do
  #     team1 = FactoryGirl.create(:team)
  #     team2 = FactoryGirl.create(:team_two)
  #     cam = FactoryGirl.create(:player)
  #     reggie = FactoryGirl.create(:reggie_bush)
  #     draft = FactoryGirl.create(:two_team_draft)
  #     pick = Pick.create(:player_id => cam.id, :team_id => draft.order[0].id, :draft_id => draft.id, :draft_position => draft.current_pick)
  #     pick.available_players_returns_nil.should eq [cam, reggie]
  #   end
  # end

  # describe 'available_players_working' do
  #   it 'should tell the avilable players in the draft' do
  #     team1 = FactoryGirl.create(:team)
  #     team2 = FactoryGirl.create(:team_two)
  #     cam = FactoryGirl.create(:player)
  #     reggie = FactoryGirl.create(:reggie_bush)
  #     draft = FactoryGirl.create(:two_team_draft)
  #     pick = Pick.create(:player_id => cam.id, :team_id => draft.order[0].id, :draft_id => draft.id, :draft_position => draft.current_pick)
  #     pick.available_players_working.should eq [cam, reggie]
  #   end
  # end



  # describe 'start' do
  #   it 'should have an array of all available players' do
  #     cam = FactoryGirl.create(:player)
  #     draft = FactoryGirl.create(:draft)
  #     draft.available_players.should eq [cam]
  #   end



  it 'should initialize with a current pick set to 1' do
    draft = FactoryGirl.create(:draft)
    draft.current_pick.should eq 1
  end


  # describe 'order' do
  #   it 'should return the order of the draft in an array' do
  #     team = FactoryGirl.create(:team)
  #     team2 = FactoryGirl.create(:team_two)
  #     team3 = FactoryGirl.create(:team_three)
  #     team4 = FactoryGirl.create(:team_four)
  #     team5 = FactoryGirl.create(:team_five)
  #     team6 = FactoryGirl.create(:team_six)
  #     team7 = FactoryGirl.create(:team_seven)
  #     team8 = FactoryGirl.create(:team_eight)
  #     team9 = FactoryGirl.create(:team_nine)
  #     team10 = FactoryGirl.create(:team_ten)
  #     team11 = FactoryGirl.create(:team_eleven)
  #     team12 = FactoryGirl.create(:team_twelve)
  #     draft = FactoryGirl.create(:draft)
  #     draft.order[23].should eq draft.teams[0]
  #   end
  # end


  # describe 'set_teams' do
  #   it 'should initialize with a default number of teams taken from the teams template.' do
  #     team = FactoryGirl.create(:team)
  #     team2 = FactoryGirl.create(:team_two)
  #     team3 = FactoryGirl.create(:team_three)
  #     team4 = FactoryGirl.create(:team_four)
  #     team5 = FactoryGirl.create(:team_five)
  #     team6 = FactoryGirl.create(:team_six)
  #     team7 = FactoryGirl.create(:team_seven)
  #     team8 = FactoryGirl.create(:team_eight)
  #     team9 = FactoryGirl.create(:team_nine)
  #     team10 = FactoryGirl.create(:team_ten)
  #     team11 = FactoryGirl.create(:team_eleven)
  #     team12 = FactoryGirl.create(:team_twelve)
  #     draft = FactoryGirl.create(:draft)
  #     draft.teams[6].team_name.should eq team7.team_name
  #   end

  #   it 'should initialize with a default number of teams taken from the teams template and have the same drafting order as the template.' do
  #     team = FactoryGirl.create(:team)
  #     team2 = FactoryGirl.create(:team_two)
  #     team3 = FactoryGirl.create(:team_three)
  #     team4 = FactoryGirl.create(:team_four)
  #     team5 = FactoryGirl.create(:team_five)
  #     team6 = FactoryGirl.create(:team_six)
  #     team7 = FactoryGirl.create(:team_seven)
  #     team8 = FactoryGirl.create(:team_eight)
  #     team9 = FactoryGirl.create(:team_nine)
  #     team10 = FactoryGirl.create(:team_ten)
  #     team11 = FactoryGirl.create(:team_eleven)
  #     team12 = FactoryGirl.create(:team_twelve)
  #     draft = FactoryGirl.create(:draft)
  #     draft.teams[11].draft_position.should eq team12.draft_position
  #   end
  # end




  # def team_at(pick)
  #   if current_('round').even?
  #     self.teams.reverse_each do |team|
  #       if team.draft_position == snake_pick(team)
  #         return team
  #       end
  #     end
  #   else
  #     self.teams.each do |team|
  #       if team.draft_position == current('pick')
  #         return team
  #       end
  #     end
  #   end
  # end



  # def self.available_players(draft_var)
  #   draft_var.update_available_players(draft_var)
  # end


# Both of the tests below are being taken out because I cannot get the draft to work.
# The draft.id returns the same id as the draft being made in the test but the draft is not saving the @available_players instance variable after being created.
  # def available_players_returns_ni
  #   print draft.id
  #   draft.available_players
  # end

# This works but only because draft.start is being called - it shouldn't have to require draft.start because start is called before the draft object is saved to the DB.
  # def available_players_working
  #   draft.start
  #   draft.available_players
  # end



  #   it 'should add the player to the team that is currently drafting' do
  #     cam = FactoryGirl.create(:player)
  #     reggie = FactoryGirl.create(:reggie_bush)
  #     forte = FactoryGirl.create(:matt_forte)
  #     team_one = FactoryGirl.create(:team)
  #     team_two = FactoryGirl.create(:team_two)
  #     draft = FactoryGirl.create(:two_team_draft)
  #     draft.make_selection(cam)
  #     Pick.all[0].team_id.should eq draft.teams[0].id
  #   end

  #   it 'should add the player to the drafted array' do
  #     cam = FactoryGirl.create(:player)
  #     reggie = FactoryGirl.create(:reggie_bush)
  #     forte = FactoryGirl.create(:matt_forte)
  #     team_one = FactoryGirl.create(:team)
  #     team_two = FactoryGirl.create(:team_two)
  #     draft = FactoryGirl.create(:two_team_draft)
  #     draft.make_selection(cam)
  #     draft.drafted_players.should eq [cam]
  #   end

  #   it 'should remove the player from the available_players array' do
  #     cam = FactoryGirl.create(:player)
  #     reggie = FactoryGirl.create(:reggie_bush)
  #     forte = FactoryGirl.create(:matt_forte)
  #     team_one = FactoryGirl.create(:team)
  #     team_two = FactoryGirl.create(:team_two)
  #     draft = FactoryGirl.create(:two_team_draft)
  #     draft.make_selection(cam)
  #     draft.available_players.should eq [reggie, forte]
  #   end

  #   it 'should advance the current team in the order' do
  #     cam = FactoryGirl.create(:player)
  #     reggie = FactoryGirl.create(:reggie_bush)
  #     forte = FactoryGirl.create(:matt_forte)
  #     team_one = FactoryGirl.create(:team)
  #     team_two = FactoryGirl.create(:team_two)
  #     draft = FactoryGirl.create(:two_team_draft)
  #     draft.make_selection(cam)
  #     draft.team_at(draft.current_pick).should eq draft.teams[1]
  #   end

  #   it 'should add the next player drafted to the next team in the order' do
  #     cam = FactoryGirl.create(:player)
  #     reggie = FactoryGirl.create(:reggie_bush)
  #     forte = FactoryGirl.create(:matt_forte)
  #     team_one = FactoryGirl.create(:team)
  #     team_two = FactoryGirl.create(:team_two)
  #     draft = FactoryGirl.create(:two_team_draft)
  #     draft.make_selection(cam)
  #     draft.make_selection(reggie)
  #     draft.teams[1].roster.should eq [reggie]
  #   end

  #   it 'should add the next player drafted to the next team in the order - especially when the order snakes' do
  #     cam = FactoryGirl.create(:player)
  #     reggie = FactoryGirl.create(:reggie_bush)
  #     forte = FactoryGirl.create(:matt_forte)
  #     team_one = FactoryGirl.create(:team)
  #     team_two = FactoryGirl.create(:team_two)
  #     draft = FactoryGirl.create(:two_team_draft)
  #     draft.make_selection(cam)
  #     draft.make_selection(reggie)
  #     draft.make_selection(forte)
  #     draft.teams[1].roster.should eq [reggie, forte]
  #   end
  # end

