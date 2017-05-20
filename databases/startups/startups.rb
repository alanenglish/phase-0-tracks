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

# CREATE STARTUPS
# create_startup(db, "Instacart", 0, "Food Tech", "San Francisco", 2012)

# CREATE VENTURE CAPITALISTS
# create_vc(db, "Andreessen Horowitz", 950000000, 2009)

# vc = [[db, "Accel Partners", 600000000, 1983], [db, "LOWERCASE CAPITAL", 35000000, 2010], [db, "Sequoia Capital", 4000000000, 1972], [db, "Lightspeed Venture Partners", 2000000000, 1971], [db, "Kleiner, Perkins, Caufield & Byers", 1500000000, 1972], [db, "Khosla Ventures", 1300000000, 2004], [db, "Insight Venture Partners", 7600000000, 1995], [db, "Intel Capital", 9800000000, 1991], [db, "Google Ventures", 1600000000, 2009], [db, "Benchmark Capital", 2300000000, 1995], [db, "Y Combinator", 700000000, 2005], [db, "Greylock Partners", 3100000000, 1965], [db, "Menlo Ventures", 2700000000, 1976], [db, "Draper Fisher Jurvetson", 4000000000, 1985], [db, "Index Ventures", 5800000000, 1996], [db, "Charles River Ventures", 1400000000, 1970], [db, "Atlas Venture", 1800000000, 1980], [db, "Goldman Sachs", 8000000000, 1869], [db, "Battery Ventures", 5500000000, 1983], [db, "Bessemer Venture Partners", 3500000000, 1911], [db, "Mayfield Fund", 2400000000, 1969], [db, "IDG Ventures", 6800000000, 1995], [db, "Granite Ventures", 1000000000, 1992], [db, "The Founders Fund", 1000000000, 2005], [db, "Fidelity Ventures", 1500000000, 1970], [db, "Elevation Partners", 1900000000, 2004], [db, "Crosslink Capital", 1800000000, 1999], [db, "Balderton Capital", 2300000000, 2007], [db, "Bain Capital", 1400000000, 1984], [db, "Austin Ventures", 3900000000, 1979], [db, "3i", 16500000000, 1945]]

#   vc.each do |item|
#     create_vc(item[0], item[1], item[2], item[3])
#   end

# CREATE INVESTMENTS
# make_investment(db, 9000000, 2014, 1, 1)




