class AlreadyBooked < StandardError
  def initialize(seat)
    super
  end
end