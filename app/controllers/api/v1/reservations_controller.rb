class Api::V1::ReservationsController < ApplicationController
  def index
    reservations = current_user.reservations.includes(:room)
    render json: reservations, include: [:room]
  end

  def create
    existing_reservation = current_user.reservations.find_by(reservation_params)
    if existing_reservation
      render json: { status: 'error', message: 'Reservation Already exists' }, status: :unprocessable_entity
    else

      @reservation = current_user.reservations.new(reservation_params)

      if @reservation.save
        render json: { status: 'Success', message: 'Reservation created successfully' }, status: :created
      else
        puts @reservation.errors.full_messages
        render json: { status: 'error', message: @reservation.errors.full_messages.to_s,
                       errors: @reservation.errors.full_messages },
               status: :unprocessable_entity
      end
    end
  end

  def show
    reservation = current_user.reservations.find(params[:id])
    render json: reservation
  end

  # def update
  #   # Code to handle PUT/PATCH request to update a reservation
  #   if @reservation.update(reservation_params)
  #     render json: @reservation
  #   else
  #     render json: @reservation.errors, status: :unprocessable_entity
  #   end
  # end

  def update
    @reservation = current_user.reservations.find(params[:id])
    if @reservation.update(reservation_params)
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFOund
    render json: {
      error: 'Reservation Not found.'
    }, status: :not_found
  end
  

  def destroy
    @reservation = current_user.reservations.find_by(id: params[:id])
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
    params.require(:reservation).permit(:check_in, :check_out, :room_id)
  end
end
