class Api::V1::RoomsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :authorize_admin!, only: %i[destroy create update]

  def index
    rooms = Room.all
    render json: rooms
  end

  def create
    if current_user&.admin?
      room = Room.new(room_params)
      if room.save
        render json: { message: 'Room successfully created' }, status: :created
      else
        render json: { error: 'Failed to create room', details: room.errors.full_messages },
               status: :unprocessable_entity
      end
    else
      render json: { error: 'Only admins can create rooms' }, status: :unauthorized
    end
  end

  def show
    @room = Room.find(params[:id])
    render json: @room
  end

  def update
    @room = Room.find(params[:id])

    if current_user&.admin?
      if @room.update(room_params)
        render json: { message: 'Room successfully updated' }, status: :ok
      else
        render json: { error: 'Failed to update room', details: @room.errors.full_messages },
               status: :unprocessable_entity
      end
    else
      render json: { error: 'Only admins can update rooms' }, status: :unauthorized
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    if room.destroy
      render json: { message: 'Room successfully deleted' }, status: :ok
    else
      render json: { error: 'Failed to delete room' }, status: :unauthorized
    end
    head :no_content
  end

  private

  def authorize_admin!
    return if current_user&.admin?

    render json: { error: 'Only admins can delete rooms' }, status: :unauthorized
  end

  # Define strong parameters for room creation
  def room_params
    params.require(:room).permit(:name, :price, :description)
  end
end
