class ReservationMailer < ApplicationMailer
  default from: 'bokningar@vittskovleby.se'

  def reservation_created(reservation)
    @reservation = reservation
    mail({
      to: 'bokningar@vittskovleby.se',
      subject: "Bokning av #{reservation.locations_to_s} från #{reservation.name}"
      })
  end

  def reservation_approved(reservation)
    @reservation = reservation
    mail({
      to: reservation.email,
      subject: "Bokning av #{reservation.locations_to_s} godkändes!"
      })
  end
end
