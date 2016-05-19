class PlayersController < ApplicationController
  before_action :find_player, only: [:show, :update, :destroy, :fired]

  def index
    @players = if params[:team_id].present?
                 @team = Team.find(params[:team_id])
                 @team.players
               else
                 Player.all
               end
    render json: @players
  end

  def create
    @team = Team.find(params[:team_id])
    @player = @team.players.build(player_params)

    if @player.save
      render json: @player, status: :created
    else
      render json: @player.errors, status: :unproccessable_entity
    end
  end

  def show
    render json: @player, status: :ok
  end

  def update
    if @player.update(player_params)
      render json: @player, status: :accepted
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  def destroy
    render json: @player, status: :ok if @player.destroy
  end

  def free
    @players = Player.free
    render json: @players
  end

  def fired
    @player.fired
    render json: { message: 'Fired!' }
  end

  private

  def player_params
    params.require(:player)
          .permit(:name, :strong_leg, :team_id)
  end

  def find_player
    @player = Player.find(params[:id])
  end
end
