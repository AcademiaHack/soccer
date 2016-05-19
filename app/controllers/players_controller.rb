class PlayersController < ApplicationController
  before_action :find_player, only: [:show, :update, :destroy, :fired]

  #GET
  def index
    @players = if params[:team_id].present?
                 @team = Team.find(params[:team_id])
                 @team.players
               else
                 Player.all
               end
    render json: @players
  end

  #POST
  def create
    @team = Team.find(params[:team_id])
    @player = @team.players.build(player_params)

    if @player.save
      render json: @player, status: :created
    else
      render json: @player.errors, status: :unproccessable_entity
    end
  end

  #GET
  def show
    render json: @player, status: :ok
  end

  #PUT
  def update
    if @player.update(player_params)
      render json: @player, status: :accepted
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  #DELETE
  def destroy
    render json: @player, status: :ok if @player.destroy
  end

  #GET
  def free
    @players = Player.free
    render json: @players
  end

  #PUT
  def fired
    @player.fired
    render json: { message: 'Fired!' }
  end

  private

  def player_params
    params.require(:player).permit(:name, :strong_leg, :team_id)
  end

  def find_player
    @player = Player.find(params[:id])
  end
end
