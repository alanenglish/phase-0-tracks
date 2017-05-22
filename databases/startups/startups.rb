require 'sqlite3'
require 'colorize'
require_relative 'data'

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
# startups = db.execute('SELECT * FROM starups')

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

def find_startup_name(database, startup_id)
  database.execute("SELECT startups.company FROM startups WHERE id=(?)", [startup_id])
end

def find_total_raised(database, company)
  database.execute("SELECT startups.total_raised FROM startups WHERE company=(?)", [company])  
end

def print_startup_list(database)
  startup_list = database.execute("SELECT * FROM startups")
    puts '*'.colorize(:red) * 30
    startup_list.map do |item|
      puts "Company: #{item[1]}"
      puts "Total Funding: $#{item[2]}".to_s.reverse.gsub(%r{([0-9]{3}(?=([0-9])))}, "\\1,").reverse
      puts "Tech Category: #{item[3]}"
      puts "Headquarters: #{item[4]}"
      puts "Year Founded: #{item[5]}"
      puts '*'.colorize(:red) * 30
    end
end

def print_specific_startup(database, company)
  specific_startup = database.execute("SELECT * FROM startups WHERE company=(?)", [company])
  puts '*'.colorize(:red) * 30
    specific_startup.map do |item|
      puts "Company: #{item[1]}"
      puts "Total Funding: $#{item[2]}".to_s.reverse.gsub(%r{([0-9]{3}(?=([0-9])))}, "\\1,").reverse
      puts "Tech Category: #{item[3]}"
      puts "Headquarters: #{item[4]}"
      puts "Year Founded: #{item[5]}"
      puts '*'.colorize(:red) * 30
    end
end

# VENTURE CAPITALIST METHODS
# venture_caps = db.execute('SELECT * FROM venture_capitalists')

def create_vc(database, firm, funds_managed, established)
  database.execute("INSERT INTO venture_capitalists (firm, funds_managed, established) VALUES (?, ?, ?)", [firm, funds_managed, established])
end

def update_vc(database, firm, updated_value)
  database.execute("UPDATE venture_capitalists SET funds_managed=(?) WHERE firm=(?)", [updated_value, firm])
end

def find_vc_id(database, firm)
  database.execute("SELECT venture_capitalists.id FROM venture_capitalists WHERE firm=(?)", [firm])
end

def print_vc_list(database)
  vc_list = database.execute("SELECT * FROM venture_capitalists")
    puts '*'.colorize(:red) * 30
    vc_list.map do |item|
      puts "Firm: #{item[1]}"
      puts "Total AUM: $#{item[2]}".to_s.reverse.gsub(%r{([0-9]{3}(?=([0-9])))}, "\\1,").reverse
      puts "Year Established: #{item[3]}"
      puts '*'.colorize(:red) * 30
    end
end

def print_specific_vc(database, firm)
  specific_vc = database.execute("SELECT * FROM venture_capitalists WHERE firm=(?)", [firm])
    puts '*'.colorize(:red) * 30
    specific_vc.map do |item|
      puts "Firm: #{item[1]}"
      puts "Total AUM: $#{item[2]}".to_s.reverse.gsub(%r{([0-9]{3}(?=([0-9])))}, "\\1,").reverse
      puts "Year Established: #{item[3]}"
      puts '*'.colorize(:red) * 30
    end
end

# INVESTMENTS MADE METHODS
# investments = db.execute('SELECT * FROM investments')

def make_investment(database, amount_funded, year_made, startup_id, vc_id)
  database.execute("INSERT INTO investments (amount_funded, year_made, startup_id, vc_id) VALUES (?, ?, ?, ?)", [amount_funded, year_made, startup_id, vc_id])
  startup_name = find_startup_name(database, startup_id)
  total_raised = find_total_raised(database, startup_name)
  new_value = total_raised[0][0] + amount_funded
  update_startup(database, startup_name, "total_raised", new_value)
end

def sum_of_investments(database, startup_id)
  sum_raised = database.execute("SELECT investments.amount_funded FROM investments WHERE startup_id=(?)", [startup_id])
end

def specific_vc_investments(database, firm)
  specific_vc = database.execute("SELECT venture_capitalists.firm, startups.company, investments.amount_funded, investments.year_made FROM investments JOIN venture_capitalists ON investments.vc_id = venture_capitalists.id JOIN startups ON investments.startup_id = startups.id WHERE firm=(?)", [firm]);
    puts '*'.colorize(:red) * 30
    specific_vc.map do |item|
      puts "VC Firm: #{item[0]}"
      puts "Startup Company: #{item[1]}"
      puts "Amount Funded: $#{item[2]}".to_s.reverse.gsub(%r{([0-9]{3}(?=([0-9])))}, "\\1,").reverse
      puts "Year Made: #{item[3]}"
      puts '*'.colorize(:red) * 30
    end
end

def specific_startup_investments(database, company)
  specific_startup = database.execute("SELECT venture_capitalists.firm, startups.company, investments.amount_funded, investments.year_made FROM investments JOIN venture_capitalists ON investments.vc_id = venture_capitalists.id JOIN startups ON investments.startup_id = startups.id WHERE company=(?)", [company]);
  puts '*'.colorize(:red) * 30
    specific_startup.map do |item|
      puts "VC Firm: #{item[0]}"
      puts "Startup Company: #{item[1]}"
      puts "Amount Funded: $#{item[2]}".to_s.reverse.gsub(%r{([0-9]{3}(?=([0-9])))}, "\\1,").reverse
      puts "Year Made: #{item[3]}"
      puts '*'.colorize(:red) * 30
    end
end

def print_investment_made(database, firm, company)
  investment_made = database.execute("SELECT venture_capitalists.firm, startups.company, investments.amount_funded, investments.year_made FROM investments JOIN venture_capitalists ON investments.vc_id = venture_capitalists.id JOIN startups ON investments.startup_id = startups.id WHERE company=(?) AND firm=(?)", [company, firm]);
  puts '*'.colorize(:red) * 30
    investment_made.map do |item|
      puts "VC Firm: #{item[0]}"
      puts "Startup Company: #{item[1]}"
      puts "Amount Funded: $#{item[2]}".to_s.reverse.gsub(%r{([0-9]{3}(?=([0-9])))}, "\\1,").reverse
      puts "Year Made: #{item[3]}"
      puts '*'.colorize(:red) * 30
    end
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
# make_investment(db, 30000000, 2014, 36, 33)

# INVESTMENTS.each do |item|
#   make_investment(db, item[0], item[1], item[2], item[3])
# end

### USER INTERFACE ###

puts "Welcome to the Startup Investment Database. Please enter your name:"
username = gets.chomp

puts "Hello, #{username.capitalize}! Good to see you again."

loop do
  puts "What task would you like to perform?"
  puts "If finished, please type 'done'."
  puts "1. REGISTER A NEW STARTUP"
  puts "2. REGISTER A NEW VENTURE CAPITAL FIRM"
  puts "3. INVEST IN A STARTUP"
  puts "4. LOOKUP A VC FIRM'S INVESTMENTS"
  puts "5. LOOKUP A STARTUP COMPANY'S FUNDING"
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
      puts "In what city is your headquarters located in?"
      location = gets.chomp
      puts "What year was your startup founded?"
      year = gets.chomp.to_i 
      create_startup(db, company_name, 0, tech_category, location, year)
      print_specific_startup(db, company_name)
    when 2
      puts "What is the name of your VC firm?"
      firm_name = gets.chomp
      puts "What is your firms total AUM?"
      total_aum = gets.chomp.to_i
      puts "What year was your firm established?"
      established = gets.chomp.to_i
      create_vc(db, firm_name, total_aum, established)
      print_specific_vc(db, firm_name)
    when 3
      print_vc_list(db)
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
          puts "SORRY MADOFF - THE SEC HAS BEEN NOTIFIED"
          puts "SYSTEM SHUTTING DOWN..."
          exit
        elsif correct_password == true
          puts "ACCESS GRANTED"
        end
      print_startup_list(db)
      puts "Which startup would you like to invest in?"
      startup_name = gets.chomp
      puts "How much would you like to invest?"
      invest_amount = gets.chomp.to_i
      reverse_startup_id = find_startup_id(db, startup_name)
      reverse_venture_id = find_vc_id(db, user_firm)
      make_investment(db, invest_amount, Time.now.year, reverse_startup_id, reverse_venture_id)
      print_investment_made(db, user_firm, startup_name)
    when 4
      print_vc_list(db)
      puts "Which VC Firm's investment's would you like to view?"
      vc_firm = gets.chomp
      specific_vc_investments(db, vc_firm)
    when 5
      print_startup_list(db)
      puts "Which Startup Company's funding information would you like to view?"
      startup = gets.chomp
      specific_startup_investments(db, startup)
    end
end
