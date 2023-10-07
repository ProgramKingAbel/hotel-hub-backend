class Api::V1::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    render json: @reservations
  end

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      render json: { status: 'Success', message: 'Reservation created successfully' }, status: :created
    else
      puts @reservation.errors.full_messages
      render json: { error: "Unable to create reservation. #{@reservation.errors.full_messages}" },
             status: :unprocessable_entity
    end
  end

  def show
    reservation = Reservation.find(params[:id])
    render json: reservation
  end

  def create
    # Code to handle POST request to create a reservation
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      render json: { status: 'Success', message: 'Reservation created successfully' }, status: :created
    else
      puts @reservation.errors.full_messages
      render json: { error: 'Unable to create reservation.' }, status: :unprocessable_entity
    end
  end

  def show
    # Code to handle GET request to retrieve a specific reservation
    reservation = Reservation.find(params[:id])
    render json: reservation
  end

  def update
    # Code to handle PUT/PATCH request to update a reservation
    if @reservation.update(reservation_params)
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    # Code to handle DELETE request to delete a reservation
    @reservation = Reservation.find_by(id: params[:id])
    if @reservation
      if @reservation.destroy
        render json: { message: 'Reservation deleted successfully.' }
      else
        render json: { error: 'Unable to delete reservation.' }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Reservation not found.' }, status: :not_found
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :room_id, :user_id)
  end
end
