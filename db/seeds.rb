Event.create([
  {title: 'Teapot painting',description: 'Painting teapots',price: 10},
  {title: 'Rock climbing',description: 'Climbing rocks',price: 15}
  ])

Availability.create([
  {date: '2018-07-01'},
  {date: '2018-07-02'}
])

AvailabilitiesEvent.create([
  {availability_id: 1,event_id: 1},
  {availability_id: 2,event_id: 2}
])
