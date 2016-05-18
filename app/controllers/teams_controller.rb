class TeamsController < ApplicationController

  def index
    @teams = Team.all
    render json: @teams
  end

  def create
    @team = Team.new(params[:user][:name])
    if @team.save
      render json: @team, status: :created, location: @team
    else
      render json: @team.errors, status: :unproccessable_entity
    end
  end

  def show
    @team = Team.find(params[:id])
    render json: @team
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
