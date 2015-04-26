class ReservationMailer < ApplicationMailer
  default from: 'kontakt@vittskovleby.se'

  def reservation_created(reservation)
    @reservation = reservation
    mail({
      to: 'kontakt@vittskovleby.se',
      subject: "Bokning av #{reservation.locations_to_s} från #{reservation.name}"
      })
  end

  def reservation_approved(reservation)
    @reservation = reservation
    mail({
      to: reservation.email,
      bcc: 'kontakt@vittskovleby.se',
      subject: "Bokning av #{reservation.locations_to_s} godkändes!"
      })
  end
end
