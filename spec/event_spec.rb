require 'event'
require 'pg'

describe Event, :event do
  describe '#all', :all do
    it 'Returns all events' do
      connection = PG.connect(dbname: 'clint_test')
      connection.exec("INSERT INTO events (title, description, price, date) VALUES('Teapot painting', 'Painting teapots', 10, '10/17/2018');")
      connection.exec("INSERT INTO events (title, description, price, date) VALUES('Rock climbing', 'Climbing rocks', 20, '11/17/2018');")

      expect(Event.all).to eq({"id"=>"15", "title"=>"Teapot painting", "description"=>"Painting teapots", "price"=>"10", "date"=>"10/17/2018"})
    end
  end
end
