class StadiaController < ApplicationController
  before_action :find_stadium, only: [:show, :update, :destroy]

  def index
    @stadia = Stadium.all
    render json: @stadia, status: :ok
  end

  def create
    @stadium = Stadium.new(stadium_params)
    if @stadium.save
      render json: @stadium, status: :created
    else
      render json: @stadium.errors, status: :unproccessable_entity
    end
  end

  def show
    render json: @stadium, status: :ok
  end

  def update
    if @stadium.update(stadium_params)
      render json: @stadium, status: :accepted, location: @stadium
    else
      render json: @stadium.errors, status: :unprocessable_entity
    end
  end

  def destroy
    render json: @stadium, status: :ok if @stadium.destroy
  end

  private

  def stadium_params
    params.require(:stadium)
          .permit(:name, :location, :capacity)
  end

  def find_stadium
    @stadium = stadium.find(params[:id])
  end
end
