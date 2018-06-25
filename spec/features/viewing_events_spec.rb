require 'pg'

feature 'viewing events' do
  scenario 'displaying events' do
    connection = PG.connect(dbname: 'clint_test')

    connection.exec("INSERT INTO events (title, description, price, date) VALUES('Teapot painting', 'Painting teapots', 10, '10/17/2018');")
    connection.exec("INSERT INTO events (title, description, price, date) VALUES('Rock climbing', 'Climbing rocks', 20, '11/17/2018');")

    visit('/events')
    expect(page).to have_content "Teapot painting"
    expect(page).to have_content "Rock climbing"
  end
end
