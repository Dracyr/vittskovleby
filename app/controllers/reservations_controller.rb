class ReservationsController < ApplicationController
  load_and_authorize_resource

  def index
    @reservations = @reservations.order(created_at: :desc)
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @reservation = Reservation.create(reservation_params)
    respond_with @reservation, notice: t('helpers.reservation_created')
  end

  def update
    @reservation.update(update_reservation_params)
    respond_with @reservation
  end

  def destroy
    @reservation.destroy
    respond_with @reservation, location: reservations_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:name, :phone, :email, :comment, :date, location_ids: [])
  end

  def update_reservation_params
    params.require(:reservation).permit(:name, :phone, :email, :comment, :date, :approved, location_ids: [])
  end
end
