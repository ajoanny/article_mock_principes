class BookSeatPort
  def initialize trains_port
    @trains_port = trains_port
  end

  def execute train_id, seat_code
    train = @trains_port.get(train_id)
    train.book(seat_code)
    @trains_port.save train
  end
end