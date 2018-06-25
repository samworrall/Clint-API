require 'pg'

class Event
  def self.all
    result = choose_database.exec("SELECT * FROM events")
  end

  private

  def self.choose_database
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'clint_test')
    else
      PG.connect(dbname: 'clint')
    end
  end
end
