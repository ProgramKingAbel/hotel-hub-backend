class Api::V1::RoomsController < ApplicationController
  def index
    # Code to handle GET request to list rooms
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
    # Code to handle DELETE request to delete a room
  end
end
