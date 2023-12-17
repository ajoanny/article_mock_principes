require 'http'

class NotifyTrainStatusHttpPort
  def initialize trains_port
    @trains_port = trains_port
  end

  def execute train_id
    train = @trains_port.get(train_id)
    HTTP
      .headers('X-Custom-Header' => "mock")
      .post('https:/www.ewample.net/trains', params: { status: train.status })
  end
end