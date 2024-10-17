require 'pg'
require 'faker'
require "bcrypt"

conn = PG.connect(dbname: 'project', user: 'joel.harde', host: 'localhost')


create_user(conn)
# create_account(conn, 2, "checking", 1000.00)

# user_id = 2 
# account_type = "checking"
# balance = 1000.00

# def trigger_create_account
# create_account(conn, account_type, balance)
# end



# conn.exec <<-SQL
#   CREATE TABLE IF NOT EXISTS library (
#     id SERIAL PRIMARY KEY,
#     title TEXT,
#     author TEXT
#   );
# SQL

# conn.exec <<-SQL
#   CREATE TABLE IF NOT EXISTS misc (
#     id SERIAL PRIMARY KEY,
#     genre TEXT,
#     publisher TEXT
#   );
# SQL

# conn.exec <<-SQL
#   UPDATE library 
#      id SERIAL PRIMARY KEY,
#      title TEXT,
#      author TEXT
#    ;
# SQL


# 100.times do
# genre =  Faker::Book.genre
# publisher = Faker::Book.publisher
# conn.exec_params("INSERT INTO misc (genre, publisher) VALUES ($1, $2)", [genre, publisher])
# end

# 100.times do
#   title = Faker::Book.title
#   author = Faker::Book.author
#   conn.exec_params("INSERT INTO library (title, author) VALUES ($1, $2)", [title, author])
# end

# conn.exec <<-SQL 
# DELETE FROM misc
# WHERE id NOT IN (
#   SELECT id FROM misc
#   ORDER BY id
#   LIMIT 100
# );
# SQL



# result = conn.exec("SELECT id, genre, publisher FROM misc")
# result.each do |row|
#   puts "Book ID: #{row['id']} - Genre: #{row['genre']} by Publisher: #{row['publisher']}"
# end


# conn.close if conn

# conn.exec <<-SQL
#   DROP TABLE IF EXISTS library
# SQL