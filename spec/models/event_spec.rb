require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '#search' do
    before(:each) do
      create_factory_objects
    end

    context '#params_present' do
      it 'Returns true' do
        search_hash = { date: '2018-06-02', location: 'London' }
        expect(Event.params_present(search_hash)).to eq(true)
      end

      it 'Returns false' do
        search_hash = {}
        expect(Event.params_present(search_hash)).to eq(false)
      end
    end

    context '#sort_by_date' do
      it 'Returns event 3' do
        search_hash = { date: '2018-06-02', location: 'London', price_range: 3 }
        expect(Event.sort_by_date(search_hash)).to eq([@event3])
      end
    end

    context 'Filtering by date' do
      context 'When given date is 2018-06-01' do
        it 'Returns event1' do
          search_hash = { date: '2018-06-01', location: 'London', price_range: 1 }
          expect(Event.search(search_hash)).to eq([@event1])
        end
      end

      context 'When given date is 2018-06-02' do
        it 'Returns event3 only' do
          search_hash = { date: '2018-06-02', location: 'London', price_range: 3 }
          expect(Event.search(search_hash)).to eq([@event3])
        end
      end

      context 'When no date is given' do
        it 'All events' do
          expect(Event.search()).to eq([@event1, @event2, @event3, @event4])
        end
      end
    end

    context 'Filtering by location' do
      context 'When location is London' do
        it 'Returns event1' do
          search_hash = { date: '2018-06-01', location: 'London', price_range: 1 }
          expect(Event.search(search_hash)).to eq([@event1])
        end
      end

      context 'When location is Edinburgh' do
        it 'Returns event2' do
          search_hash = { date: '2018-06-01', location: 'Edinburgh', price_range: 2 }
          expect(Event.search(search_hash)).to eq([@event2])
        end
      end
    end

    context 'Filtering by price range' do
      context 'When price range is 1' do
        it 'Returns event1' do
          search_hash = { date: '2018-06-03', location: 'London', price_range: 1 }
          expect(Event.search(search_hash)).to eq([@event4])
        end
      end

      context 'When price range is 2' do
        it 'Returns event2' do
          search_hash = { date: '2018-06-01', location: 'Edinburgh', price_range: 2 }
          expect(Event.search(search_hash)).to eq([@event2])
        end
      end
    end
   end
end
