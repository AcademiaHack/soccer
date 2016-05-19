class StadiaController < ApplicationController
  before_action :find_stadium, only: [:show, :update, :destroy]

  #GET
  def index
    @stadia = Stadium.all
    render json: @stadia, status: :ok
  end

  #POST
  def create
    @stadium = Stadium.new(stadium_params)
    if @stadium.save
      render json: @stadium, status: :created
    else
      render json: @stadium.errors, status: :unproccessable_entity
    end
  end

  #GET
  def show
    render json: @stadium, status: :ok
  end

  #PUT, PATCH
  def update
    if @stadium.update(stadium_params)
      render json: @stadium, location: @stadium
    else
      render json: @stadium.errors, status: :unprocessable_entity
    end
  end

  #DELETE
  def destroy

    render json: @stadium, status: :ok if @stadium.destroy
  end

  private


  def stadium_params
    params.require(:stadium).permit(:name, :location, :capacity)
  end

  def find_stadium
    @stadium = Stadium.find(params[:id])
  end

end
