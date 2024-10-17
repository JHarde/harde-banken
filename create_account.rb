
def create_account(conn, user_id, account_type, balance)
  query = %Q(
    INSERT INTO accounts (user_id, account_type, balance) VALUES ($1, $2, $3) RETURNING account_id;
  )

  begin
    conn.prepare('insert_account', query)
    result = conn.exec_prepared('insert_account', [user_id, account_type, balance])
    account_id = result[0]['account_id']
    puts "Account created with ID: #{account_id}"
  rescue PG::Error => e
    puts "An error occurred: #{e.message}"
  ensure
    conn.exec("DEALLOCATE insert_account")
  end
end