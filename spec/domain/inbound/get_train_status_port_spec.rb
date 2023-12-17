require 'domain/models/train'
require 'domain/inbound/get_train_status_port'
require 'fake_implem/fake_trains_adapter'

RSpec.describe GetTrainStatusPort do
  let(:trains_port) { FakeTrainsAdapter.new }

  context 'fake' do
    it 'returns the train status' do
      train = instance_double(Train, status: Train::ON_TIME)
      allow(trains_port).to receive(:get).with(12).and_return(train)

      status = GetTrainStatusPort.new(trains_port).execute(12)

      expect(status).to eq Train::ON_TIME
    end
  end

  context 'mock' do
    it 'returns the train status' do
      train = instance_double(Train, status: Train::ON_TIME)
      expect(trains_port).to receive(:get).with(12).and_return(train)

      status = GetTrainStatusPort.new(trains_port).execute(12)

      expect(status).to eq Train::ON_TIME
    end
  end

  context 'test suite' do
    context 'when the train status is ON_TIME' do
      it 'returns ON_TIME' do
        train = instance_double(Train, status: Train::ON_TIME)
        allow(trains_port).to receive(:get).with(12).and_return(train)

        status = GetTrainStatusPort.new(trains_port).execute(12)

        expect(status).to eq Train::ON_TIME
      end
    end

    context 'when the train status is LATE' do
      it 'returns LATE' do
        train = instance_double(Train, status: Train::LATE)
        allow(trains_port).to receive(:get).with(12).and_return(train)

        status = GetTrainStatusPort.new(trains_port).execute(12)

        expect(status).to eq Train::LATE
      end
    end

    context 'when the train status is AHEAD_OF_TIME' do
      it 'returns AHEAD_OF_TIME' do
        train = instance_double(Train, status: Train::AHEAD_OF_TIME)
        allow(trains_port).to receive(:get).with(12).and_return(train)

        status = GetTrainStatusPort.new(trains_port).execute(12)

        expect(status).to eq Train::AHEAD_OF_TIME
      end
    end

    context 'for any train' do
      it 'returns the train status' do
        train = instance_double(Train, status: Train::AHEAD_OF_TIME)
        allow(trains_port).to receive(:get).with(13).and_return(train)

        status = GetTrainStatusPort.new(trains_port).execute(13)

        expect(status).to eq Train::AHEAD_OF_TIME
      end
    end
  end
end
