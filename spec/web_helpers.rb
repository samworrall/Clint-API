def create_factory_objects
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
