class Api::V1::LocationsController < ApplicationController

  def index
    @locations = Location.all
    render json: @locations
  end

  def update
    @location.update(location_params)
    if @location.save
      render json: @location, status: :accepted
    else
      render json: { errors: @location.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def create
    @location =  Location.new(location_params)
    if @location.save
      render json: @location
    else
      render json: { errors: @location.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def location_params
    params.require(:location).permit(:user_id, :latitude, :longitude, :title, :description)
  end




end
