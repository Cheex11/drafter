class PicksController < ApplicationController
  def index
    @picks = Pick.all
  end

  def show
    @pick = Pick.find(params[:id])
  end

  def edit
    @pick = Pick.find(params[:id])
  end

  # def update
  #   @player = Player.find(params[:id])
  #   @player.update(player_params)
  #   redirect_to players_path
  # end

  def new
    @pick = Pick.new
    render('new.html.erb')
  end

  def create
    @pick = Pick.create(player_params)
    @pick.save
    redirect_to('/picks')
  end

  # def destroy
  #   @player = Player.find(params[:id])
  #   @player.destroy
  #   redirect_to('/players')
  # end

private

  def pick_params
    params.require(:pick).permit(:team_id, :player_id, :draft_id, :draft_positoin)
  end

end