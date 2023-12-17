class GetTrainStatusPort
  def initialize trains_port
    @trains_port = trains_port
  end

  def execute train_id
    train = @trains_port.get(train_id)
    train.status
  end
end
