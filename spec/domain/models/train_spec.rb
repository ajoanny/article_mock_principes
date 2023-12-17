require 'domain/models/train'
require 'domain/error/non_bookable'
require 'domain/error/already_booked'

RSpec.describe Train do
  describe '#book' do
    context 'when the seat is not booked' do
      it 'book a seat' do
        train = Train.new 1, ['A1'], [], Train::ON_TIME
        train.book 'A1'
        expect(train.booked_seats).to include('A1')
      end
    end

    context 'when several seats are booked' do
      it 'book all given seat' do
        train = Train.new 1, ['B1','B2','B3'], [], Train::ON_TIME
        train.book 'B1'
        train.book 'B2'
        train.book 'B3'
        expect(train.booked_seats).to include('B1', 'B2', 'B3')
      end
    end

    context 'when the given seat is not bookable' do
      it 'throws a non bookable error' do
        train = Train.new 1, ['B1'], [], Train::ON_TIME
        expect { train.book 'B2' }.to raise_error(NonBookable,'B2')
      end
    end

    context 'when the given seat is not already bookable' do
      it 'throws an already booked error' do
        train = Train.new 1, ['B1'], ['B1'], Train::ON_TIME
        expect { train.book 'B1' }.to raise_error(AlreadyBooked,'B1')
      end
    end
  end
end
