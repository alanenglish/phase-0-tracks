require 'sqlite3'
require 'faker'
require_relative 'data.rb'

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

# STARTUP METHODS

def create_startup(database, company, total_raised, category, city, founded)
  database.execute("INSERT INTO startups (company, total_raised, category, city, founded) VALUES (?, ?, ?, ?, ?)", [company, total_raised, category, city, founded])
end

def update_startup(database, company, field, updated_value)
  database.execute("UPDATE startups SET #{field}=(?) WHERE company=(?)", [updated_value, company])
end

def shutdown_startup(database, company)
  database.execute("DELETE FROM startups WHERE company=(?)", [company])
end

# VENTURE CAPITALIST METHODS

def create_vc(database, firm, funds_managed, established)
  database.execute("INSERT INTO venture_capitalists (firm, funds_managed, established) VALUES (?, ?, ?)", [firm, funds_managed, established])
end

def update_vc(database, firm, updated_value)
  database.execute("UPDATE venture_capitalists SET funds_managed=(?) WHERE firm=(?)", [updated_value, firm])
end

# INVESTMENTS MADE METHODS

def make_investment(database, amount_funded, year_made, startup_id, vc_id)
  database.execute("INSERT INTO investments (amount_funded, year_made, startup_id, vc_id) VALUES (?, ?, ?, ?)", [amount_funded, year_made, startup_id, vc_id])
end

### CREATE STARTUPS ###
# create_startup(db, "Instacart", 0, "Food Tech", "San Francisco", 2012)

# STARTUPS.each do |item|
#    create_startup(db, item[0], item[1], item[2], item[3], item[4])
# end


### CREATE VENTURE CAPITALISTS ###
# create_vc(db, "Andreessen Horowitz", 950000000, 2009)

# VC.each do |item|
#   create_vc(db, item[0], item[1], item[2])
# end


### CREATE INVESTMENTS ###
# make_investment(db, 9000000, 2014, 1, 1)




