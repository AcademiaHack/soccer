class TeamsController < ApplicationController
  before_action :find_team, only: [:show, :update, :destroy]

  def index
    @teams = Team.all
    render json: @teams, status: :ok
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      render json: @team, status: :created
    else
      render json: @team.errors, status: :unproccessable_entity
    end
  end

  def show
    render json: @team, status: :ok
  end

  def update
    if @team.update(team_params)
      render json: @team, status: :accepted, location: @team
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  def destroy
    render json: @team, status: :ok if @team.destroy
  end

  private

  def team_params
    params.require(:team)
          .permit(:name, :nationality, :owner)
  end

  def find_team
    @team = Team.find(params[:id])
  end
end
