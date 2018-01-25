class ReservationMailer < ApplicationMailer
  default from: 'Vittskövle Byalag <kontakt@vittskovleby.se>'

  def reservation_created(reservation)
    @reservation = reservation
    mail({
      to: User.with_role('reservation_manager').pluck(:email),
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
