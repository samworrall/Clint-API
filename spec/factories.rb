FactoryBot.define do
  factory :availabilities_event do
    availability nil
    event nil
  end
  factory :availability do
    date "2018-06-26"
  end
  factory :event do
    title 'event1'
    description 'description1'
    price 10
    date '01/07/2018'
  end
end
