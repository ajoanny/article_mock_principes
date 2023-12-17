require 'domain/error/non_bookable'
require 'domain/error/already_booked'

class Train
  attr_reader :reference, :status

  ON_TIME = 'ON-TIME'
  LATE = 'LATE'
  AHEAD_OF_TIME = 'AHEAD-OF-TIME'

  def initialize reference, seats, booked_seat, status
    @reference = reference
    @seats = seats
    @booked_seat = booked_seat
    @status = status
  end

  def book seat
    check_bookable seat
    @booked_seat.push seat
  end

  def booked_seats
    @booked_seat
  end

  def == object
    object.is_a?(Train) && object.reference == @reference
  end

  private

  def check_bookable seat
    if @seats.none?(seat)
      raise NonBookable.new seat
    end
    if @booked_seat.include? seat
      raise AlreadyBooked.new seat
    end
  end
end
