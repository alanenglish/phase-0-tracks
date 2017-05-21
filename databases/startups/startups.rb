require 'sqlite3'
require 'colorize'
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

def find_startup_id(database, company)
  database.execute("SELECT startups.id FROM startups WHERE company=(?)", [company])
end

# VENTURE CAPITALIST METHODS

def create_vc(database, firm, funds_managed, established)
  database.execute("INSERT INTO venture_capitalists (firm, funds_managed, established) VALUES (?, ?, ?)", [firm, funds_managed, established])
end

def update_vc(database, firm, updated_value)
  database.execute("UPDATE venture_capitalists SET funds_managed=(?) WHERE firm=(?)", [updated_value, firm])
end

def find_vc_id(database, firm)
  database.execute("SELECT venture_capitalists.id FROM venture_capitalists WHERE firm=(?)", [firm])
end

# INVESTMENTS MADE METHODS

def make_investment(database, amount_funded, year_made, startup_id, vc_id)
  database.execute("INSERT INTO investments (amount_funded, year_made, startup_id, vc_id) VALUES (?, ?, ?, ?)", [amount_funded, year_made, startup_id, vc_id])
end

def sum_of_investments(database, startup_id)
  sum_raised = database.execute("SELECT investments.amount_funded FROM investments WHERE startup_id=(?)", [startup_id])
end


### CREATE STARTUPS ###
# create_startup(db, "Instacart", 0, "Food Tech", "San Francisco", 2012)

# STARTUPS.each do |item|
#    create_startup(db, item[0], item[1], item[2], item[3], item[4])
# end


### CREATE VENTURE CAPITAL FIRM ###
# create_vc(db, "Andreessen Horowitz", 950000000, 2009)
# create_vc(db, "Hooli Ventures", 4000000000, 2000)

# VC.each do |item|
#   create_vc(db, item[0], item[1], item[2])
# end


### CREATE INVESTMENTS ###
# make_investment(db, 20000000, 2014, 1, 1)

# INVESTMENTS.each do |item|
#   make_investment(db, item[0], item[1], item[2], item[3])
# end

### USER INTERFACE ###

puts "WELCOME TO THE STARTUP INVESTMENT DATABASE. PLEASE ENTER YOUR NAME:"
username = gets.chomp

puts "HELLO, #{username.upcase} - GOOD TO SEE YOU AGAIN."

loop do 
  puts "WHAT WOULD YOU LIKE TO DO:"
  puts "IF FINISHED, PLEASE TYPE 'DONE'."
  puts "1. Register your new startup"
  puts "2. Register your new venture capital firm"
  puts "3. Invest in a startup"
  puts "4. Lookup investment information by venture capital firm"
  puts "5. Lookup investment information by startup company"
  user_choice = gets.chomp
    if user_choice.downcase == "done"
      break
    end
    case user_choice.to_i
    when 1
      puts "What is your company name?"
      company_name = gets.chomp
      puts "What technology category is your startup in?"
      tech_category = gets.chomp
      puts "What city is your headquarters in?"
      location = gets.chomp
      puts "What year was your startup founded?"
      year = gets.chomp.to_i 
      create_startup(db, company_name, 0, tech_category, location, year)
      # print the result of their entry
    when 2
      puts "What is the name of your VC firm?"
      firm_name = gets.chomp
      puts "What is your firms total AUM?"
      total_aum = gets.chomp.to_i
      puts "What year was your firm established?"
      established = gets.chomp.to_i
      create_vc(db, firm_name, total_aum, established)
      # print the result of their entry
    when 3
      puts "What VC firm are you with?"
      user_firm = gets.chomp
      puts "What is your password?"
      firm_password = gets.chomp
      correct_password = false
      USER_LOGINS.each do |firm, password|
        if firm == user_firm && password == firm_password
          correct_password = true
          break
        else
          correct_password = false
        end
      end
        if correct_password == false
          puts "SORRY MADOFF, THE SEC HAS BEEN NOTIFIED - BETTER RUN!!"
          puts "SYSTEM SHUTTING DOWN..."
          exit
        elsif correct_password == true
          puts "ACCESS GRANTED"
        end
        # print startup list
      puts "Which startup would you like to invest in?"
      startup_name = gets.chomp

      puts "How much would you like to invest?"
      invest_amount = gets.chomp.to_i
      sup_id = find_startup_id(db, startup_name)
      venture_id = find_vc_id(db, user_firm)
      make_investment(db, invest_amount, Time.now.year, sup_id, venture_id)
      # print that specific investment
    end


end


    









