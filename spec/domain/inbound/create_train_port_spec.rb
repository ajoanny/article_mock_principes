require 'domain/models/train'
require 'domain/inbound/create_train_port'
require 'server_side/adapter/trains_sql_adapter'
require 'server_side/ORM/train'

describe CreateTrainPort do
  it 'creates the train' do
    train = Train.new('ABCD', [], [], Train::ON_TIME)
    trains_port = TrainsSqlAdapter.new
    expect(ORM::Train).to receive(:create!).with(train)

    CreateTrainPort.new(trains_port).execute('ABCD')
  end
end
