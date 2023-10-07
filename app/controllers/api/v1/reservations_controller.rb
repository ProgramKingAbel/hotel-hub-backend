class Api::V1::ReservationsController < ApplicationController
  
  def index
    # Code to handle GET request to list reservations
    reservation = Reservation.all
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
  
    