require 'pg'

p "Setting up test database..."

connection = PG.connect(dbname: 'clint_test')

connection.exec("TRUNCATE events;")
