require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '#search' do
    before(:each) do
      @availability1 = FactoryBot.create(:availability, id: 1)
      @availability2 = FactoryBot.create(:availability, id: 2, date: '2018-06-02')
      @event1 = FactoryBot.create(:event, id: 1)
      @event2 = FactoryBot.create(:event, id: 2)
      @AE1 = FactoryBot.create(:availabilities_event, id: 1)
      @AE2 = FactoryBot.create(:availabilities_event, id: 2, event_id: 2)
    end

    context 'When given date is 2018-06-01' do
      it 'Returns event1' do
        search_hash = { date: '2018-06-01' }
        expect(Event.search(search_hash)).to eq([@event1, @event2])
      end
    end
  end
end
