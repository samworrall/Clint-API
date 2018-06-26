require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '#search' do
    before(:each) do
      @event1 = FactoryBot.create(:event)
      @event2 = FactoryBot.create(:event, date: '02/07/2018')
    end

    context 'When given date is 02/07/2018' do
      it 'Returns event1' do
        search_hash = { date: '02/07/2018' }
        expect(Event.search(search_hash)).to eq(@event2)
      end
    end
  end
end
