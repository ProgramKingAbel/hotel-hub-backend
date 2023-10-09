class Api::V1::RoomsController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]
  # before_action :authorize_admin!, only: [:destroy]

  def index
    rooms = Room.all
    render json: rooms
  end

  def create
    # Code to handle POST request to create a room
  end

  def show
    # Code to handle GET request to retrieve a specific room
    @room = Room.find(params[:id])
    render json: @room
  end

  def update
    # Code to handle PUT/PATCH request to update a room
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    if room.destroy
      render json: { message: "Room successfully deleted" }, status: :ok
    else
      render json: { error: "Failed to delete room" }, status: :unprocessable_entity
    end
    head :no_content
  end

  private

  def authorize_admin!
    unless current_user && current_user.admin?
      render json: { error: "Only admins can delete rooms" }, status: :unauthorized
    end
  end
end
