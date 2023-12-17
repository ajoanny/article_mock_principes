require 'http'
require 'domain/inbound/notify_train_status_http_port'

class FakeHttpObject
  def post url, params
  end
end

describe NotifyTrainStatusHttpPort do
  let(:trains_port) { FakeTrainsAdapter.new }

  it 'send the train status' do
    httpObject = FakeHttpObject.new
    train = instance_double(Train, status: Train::ON_TIME)
    allow(trains_port).to receive(:get).with(1).and_return(train)
    allow(HTTP).to receive(:headers)
                     .with({ "X-Custom-Header" => 'mock'})
                     .and_return(httpObject)
    expect(httpObject).to receive(:post)
                      .with('https:/www.ewample.net/trains', params: { status: Train::ON_TIME})

    NotifyTrainStatusHttpPort.new(trains_port).execute(1)
  end
end