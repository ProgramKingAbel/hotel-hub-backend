class Api::V1::ReservationsController < ApplicationController
  def index
    # Code to handle GET request to list reservations
    reservation = Reservation.all
    render json: reservation
  end

  def create
    # Code to handle POST request to create a reservation
  end

  def show
    # Code to handle GET request to retrieve a specific reservation
  end

  def update
    # Code to handle PUT/PATCH request to update a reservation
  end

  def destroy
    # Code to handle DELETE request to delete a reservation
  end
end
