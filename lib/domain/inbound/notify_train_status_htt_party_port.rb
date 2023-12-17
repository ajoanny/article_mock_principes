class NotifyTrainStatusHttPartyPort

  def initialize trains_port
    @trains_port = trains_port
  end
  def execute train_id
    train = @trains_port.get(train_id)
    HTTParty.post(
      'https:/www.ewample.net/trains',
      body: { status: train.status }.to_json,
      headers: { 'X-Custom-Header' => 'Mock' }
    )
  end
end
