class MatchesController < ApplicationController
  before_action :find_match, only: [:show, :update, :destroy]

  def index
    @matches = if params[:stadium_id].present?
                 @stadium = Stadium.find(params[:stadium_id])
                 @stadium.matches
               else
                 Match.all
               end
    render json: @matches
  end

  def create
    @stadium = Stadium.find(params[:stadium_id])
    @match = @stadium.matches.build(match_params)

    if @match.save
      render json: @match, status: :created
    else
      render json: @match.errors, status: :unproccessable_entity
    end
  end

  def show
    render json: @match, status: :ok
  end

  def update
    if @match.update(match_params)
      render json: @match, status: :accepted
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end

  def destroy
    render json: @match, status: :ok if @match.destroy
  end

  private

  def match_params
    params.require(:match)
          .permit(:datetime, :local_team_id, :invited_team_id, :stadium_id)
  end

  def find_match
    @player = Player.find(params[:id])
  end
end
