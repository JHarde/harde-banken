
def create_user(conn)

  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email(name: "#{first_name} #{last_name}")
  password = Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_characters: true)


  password_hash = BCrypt::Password.create(password)


  query = %Q(
    INSERT INTO users (first_name, last_name, email, password) VALUES ($1, $2, $3, $4) RETURNING user_id;
  )


  begin

    conn.prepare('insert_user', query)
    result = conn.exec_prepared('insert_user', [first_name, last_name, email, password_hash])


    user_id = result[0]['user_id']
    puts "User created with ID: #{user_id} and password: #{password}"
  rescue PG::Error => e
    puts "An error occurred: #{e.message}"
  ensure

    conn.exec("DEALLOCATE insert_user")
  end
end


create_user(conn)