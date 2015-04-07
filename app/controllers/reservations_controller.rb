class ReservationsController < ApplicationController
  load_resource
  authorize_resource except: :index

  def index
    @reservations = @reservations.includes(:locations).order(created_at: :desc)
    authorize!(:index, @reservations) if params[:format] != 'json'
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @reservation = Reservation.create(reservation_params)

    ReservationMailer.reservation_created(@reservation).deliver
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

  def approve
    @reservation = Reservation.find(params[:reservation_id])
    @reservation.update(approved: true)

    if params[:send_approval_mail] == 'true'
      ReservationMailer.reservation_approved(@reservation).deliver
    end
    redirect_to reservations_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:name, :phone, :email, :comment, :date, location_ids: [])
  end

  def update_reservation_params
    params.require(:reservation).permit(:approved, :name, :phone, :email, :comment, :date, location_ids: [])
  end
end
