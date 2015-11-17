class ReservationsController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource only: :index

  def index
    @reservations = @reservations.includes(:locations).order(created_at: :desc)
    authorize!(:index, Reservation) unless params[:format] == 'json'
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
    if @reservation.update(approved: true)
      if params[:send_approval_mail] == '1'
        ReservationMailer.reservation_approved(@reservation).deliver
      end
      redirect_to reservations_path, success: t('.reservation_approved')
    else
      @reservations = Reservation
        .accessible_by(current_ability)
        .includes(:locations)
        .order(created_at: :desc)
      render 'index'
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(
      :name,
      :phone,
      :email,
      :comment,
      :date,
      :invoice_address,
      location_ids: []
    )
  end

  def update_reservation_params
    params.require(:reservation).permit(
      :approved,
      :name,
      :phone,
      :email,
      :comment,
      :date,
      :invoice_address,
      location_ids: []
    )
  end
end
