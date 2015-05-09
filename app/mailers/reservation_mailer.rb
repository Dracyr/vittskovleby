class ReservationMailer < ApplicationMailer
  default from: 'kontakt@vittskovleby.se'

  def reservation_created(reservation)
    @reservation = reservation
    mail({
      to: User.admin_emails,
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
