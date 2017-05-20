require 'sqlite3'
require 'faker'

db = SQLite3::Database.new("startups_vc.db")

startup_table = <<-SQL
CREATE TABLE IF NOT EXISTS startups (
  id INTEGER PRIMARY KEY,
  company VARCHAR(255),
  total_raised INT,
  category VARCHAR(255),
  city VARCHAR(255),
  founded INT
  );
SQL

vc_table = <<-SQL
CREATE TABLE IF NOT EXISTS venture_capitalists (
  id INTEGER PRIMARY KEY,
  firm VARCHAR(255),
  funds_managed INT,
  established INT
  );
SQL

investments_table = <<-SQL
CREATE TABLE IF NOT EXISTS investments (
  id INTEGER PRIMARY KEY,
  amount_funded INT,
  year_made INT,
  startup_id,
  vc_id,
  FOREIGN KEY (startup_id) REFERENCES startups (id),
  FOREIGN KEY (vc_id) REFERENCES venture_capitalists (id)
  );
SQL

# db.execute(startup_table)
# db.execute(vc_table)
# db.execute(investments_table)

def create_startup(database, company, total_raised, category, city, founded)
  database.execute("INSERT INTO startups (company, total_raised, category, city, founded) VALUES (?, ?, ?, ?, ?)", [company, total_raised, category, city, founded])
end

def create_vc(database, firm, funds_managed, established)
  database.execute("INSERT INTO venture_capitalists (firm, funds_managed, established) VALUES (?, ?, ?)", [firm, funds_managed, established])
end

def create_investments(database, amount_funded, year_made, startup_id, vc_id)
  database.execute("INSERT INTO investments (amount_funded, year_made, startup_id, vc_id) VALUES (?, ?, ?, ?)", [amount_funded, year_made, startup_id, vc_id])
end

