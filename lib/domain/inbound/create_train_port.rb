class CreateTrainPort
  def initialize trains_port
    @trains_port = trains_port
  end

  def execute reference
    train = Train.new(reference,[], [], Train::ON_TIME)
    @trains_port.create train
  end
end