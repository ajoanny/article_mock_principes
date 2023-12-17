require 'domain/inbound/book_seat_port'
require 'fake_implem/fake_trains_adapter'

RSpec.describe BookSeatPort do
  let(:trains_port) { FakeTrainsAdapter.new }

  context 'mock on train object' do
    it 'book a seat' do
      train = instance_double(Train)
      expect(train).to receive(:book).with('1A')
      allow(trains_port).to receive(:get).with(12).and_return(train)

      BookSeatPort.new(trains_port).execute(12, '1A')
    end

    it 'book a seat' do
      train = instance_double(Train, :book)
      allow(train).to receive(:book)
      allow(trains_port).to receive(:get).and_return(train)
      expect(trains_port).to receive(:save).with(train)

      BookSeatPort.new(trains_port).execute(13, 'B1')
    end
  end

  context 'train instance' do
    it 'book a seat' do
      train = Train.new 12, ['1A'], [], Train::ON_TIME
      allow(trains_port).to receive(:get).with(12).and_return(train)

      BookSeatPort.new(trains_port).execute(12, '1A')

      expect(train.booked_seats).to eq ['1A']
    end
  end
end
