FactoryBot.define do
  factory :availabilities_event do
    availability_id 1
    event_id 1
  end
  factory :availability do
    date "2018-06-01"
  end
  factory :event do
    title 'event1'
    description 'description1'
    price 10
  end
end
