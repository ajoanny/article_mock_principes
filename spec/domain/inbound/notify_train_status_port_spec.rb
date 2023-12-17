require 'domain/models/train'
require 'domain/inbound/notify_train_status_port'
require 'fake_implem/fake_trains_adapter'
require 'fake_implem/fake_train_status_notification_adapter'

describe NotifyTrainStatusPort do
  let(:trains_port) { FakeTrainsAdapter.new }
  let(:train_status_notification_port) { FakeTrainStatusNotificationAdapter.new }

  it 'send a notification' do
    train = instance_double(Train, status: Train::ON_TIME)
    allow(trains_port).to receive(:get).with(1).and_return(train)
    expect(train_status_notification_port).to receive(:notify).with(train)

    NotifyTrainStatusPort.new(trains_port, train_status_notification_port).execute(1)
  end
end
