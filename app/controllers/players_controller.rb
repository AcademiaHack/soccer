class PlayersController < ApplicationController
  def index
    if params[:team_id].present?
      @team = Team.find (params[:team_id])
      @players = @team.players
    else
      @players = Player.all
    end
    render json: @players
  end
  def show

  end

  def free
    @players = Player.where(team_id: nil)

    render json: @players
  end

  def fired
    @player = Player.find(params[:id])
    @player.fired
    render json: {msj: "listo"}
  end
end
