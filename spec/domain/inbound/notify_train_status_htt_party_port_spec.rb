require 'httparty'
require 'domain/models/train'
require 'domain/inbound/notify_train_status_htt_party_port'
require 'fake_implem/fake_trains_adapter'

RSpec.describe NotifyTrainStatusHttPartyPort do
  let(:trains_port) { FakeTrainsAdapter.new }

  it 'send the train status' do
    train = instance_double(Train, status: Train::ON_TIME)
    allow(trains_port).to receive(:get).with(1).and_return(train)
    expect(HTTParty).to receive(:post)
                          .with(
                            'https:/www.ewample.net/trains',
                            body: '{"status":"ON-TIME"}',
                            headers: { 'X-Custom-Header' => 'Mock' }
                          )


    NotifyTrainStatusHttPartyPort.new(trains_port).execute(1)
  end
end
