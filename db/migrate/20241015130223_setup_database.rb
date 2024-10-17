class SetupDatabase < ActiveRecord::Migration[7.2]
  def change
     # Create a new user if it doesn't already exist
    execute <<-SQL
      DO $$
      BEGIN
        IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'postgresql') THEN
          CREATE USER postgresql WITH PASSWORD 'psql5432';
        END IF;
      END $$;
    SQL

    # Create a new database if it doesn't already exist
    execute <<-SQL
      DO $$
      BEGIN
        IF NOT EXISTS (SELECT 1 FROM pg_database WHERE datname = 'notemanagement') THEN
          CREATE DATABASE notemanagement;
        END IF;
      END $$;
    SQL

    # Grant privileges to the user on the new database
    execute "GRANT ALL PRIVILEGES ON DATABASE notemanagement TO postgresql;"

    # Create tables if they don't already exist
    execute <<-SQL
      CREATE TABLE IF NOT EXISTS users (  
        id SERIAL PRIMARY KEY,  
        username VARCHAR(50) NOT NULL,  
        email VARCHAR(100) NOT NULL UNIQUE,  
        password VARCHAR(255) NOT NULL,  
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP  
      );
    SQL
  end
end