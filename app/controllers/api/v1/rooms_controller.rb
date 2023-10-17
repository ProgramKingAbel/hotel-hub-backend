class Api::V1::RoomsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  def index
    rooms = Room.all
    render json: rooms
  end

  def create
    room = Room.new(room_params)
    if room.save
      render json: { message: 'Room successfully created' }, status: :created
    else
      render json: { error: 'Failed to create room', details: room.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    room = Room.find(params[:id])
    render json: room
  end

  def update
    room = Room.find(params[:id])

    if room.update(room_params)
      render json: { message: 'Room successfully updated' }, status: :ok
    else
      render json: { error: 'Failed to update room', details: room.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    render json: { message: 'Room successfully deleted' }, status: :ok
  end

  private

  def room_params
    params.require(:room).permit(:name, :price, :description, :image, :room_type)
  end
end
