require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '#search' do
    before(:each) do
      @availability1 = FactoryBot.create(:availability, id: 1)
      @availability2 = FactoryBot.create(:availability, id: 2, date: '2018-06-02')
      @event1 = FactoryBot.create(:event, id: 1)
      @event2 = FactoryBot.create(:event, id: 2, location: 'Edinburgh', price_range: 2)
      @event3 = FactoryBot.create(:event, id: 3, price_range: 3, category: 'group fun')
      @AE1 = FactoryBot.create(:availabilities_event, id: 1)
      @AE2 = FactoryBot.create(:availabilities_event, id: 2, event_id: 2)
      @AE3 = FactoryBot.create(:availabilities_event, id: 3, event_id: 3, availability_id: 2)
    end

    context '#params_present' do
      it 'Returns true' do
        search_hash = { date: '2018-06-02' }
        expect(Event.params_present(search_hash)).to eq(true)
      end

      it 'Returns false' do
        search_hash = {}
        expect(Event.params_present(search_hash)).to eq(false)
      end
    end

    context '#sort_by_date' do
      it 'Returns event 3' do
        search_hash = { date: '2018-06-02' }
        expect(Event.sort_by_date(search_hash)).to eq([@event3])
      end
    end

    context '#sort_by_location' do
      it 'Returns event 2' do
        search_hash = { location: 'Edinburgh' }
        expect(Event.sort_by_location(search_hash)).to eq([@event2])
      end
    end

    context 'Filtering by date' do
      xcontext 'When given date is 2018-06-01' do
        it 'Returns event1 and event 2' do
          search_hash = { date: '2018-06-01' }
          expect(Event.search(search_hash)).to eq([@event1, @event2])
        end
      end

      xcontext 'When given date is 2018-06-02' do
        it 'Returns event3 only' do
          search_hash = { date: '2018-06-02' }
          expect(Event.search(search_hash)).to eq([@event3])
        end
      end

      context 'When no date is given' do
        it 'All events' do
          expect(Event.search()).to eq([@event1, @event2, @event3])
        end
      end
    end

    context 'Filtering by location' do
      xcontext 'When location is London' do
        it 'Returns event1 and event 3' do
          search_hash = { location: 'London' }
          expect(Event.search(search_hash)).to eq([@event1, @event3])
        end
      end
    end
  end
end
