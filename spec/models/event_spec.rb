require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '#search' do
    before(:each) do
      @availability1 = FactoryBot.create(:availability, id: 1)
      @availability2 = FactoryBot.create(:availability, id: 2, date: '2018-06-02')
      @availability3 = FactoryBot.create(:availability, id: 3, date: '2018-06-03')
      @event1 = FactoryBot.create(:event, id: 1)
      @event2 = FactoryBot.create(:event, id: 2, location: 'Edinburgh', price_range: 2)
      @event3 = FactoryBot.create(:event, id: 3, price_range: 3, category: 'group fun')
      @event4 = FactoryBot.create(:event, id: 4)
      @AE1 = FactoryBot.create(:availabilities_event, id: 1)
      @AE2 = FactoryBot.create(:availabilities_event, id: 2, event_id: 2)
      @AE3 = FactoryBot.create(:availabilities_event, id: 3, event_id: 3, availability_id: 2)
      @AE4 = FactoryBot.create(:availabilities_event, id: 4, event_id: 4, availability_id: 3)
      @AE5 = FactoryBot.create(:availabilities_event, id: 5, event_id: 2, availability_id: 3)
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
    end
   end
end
