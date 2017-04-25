=begin
INTERIOR DESIGN INC. - PROSPECTIVE CLIENT
- Ask the potential client several questions
  - the clients name
  - the clients age and convert to integer
  - how many children the client has and convert to integer
  - what their preferred decor theme is
  - what their budget is (dollar amount)
- Gather user data entries
- Store data into key value pairs in hash
- Print the hash onto the screen when all information is complete
- Give user the ability to update a key, give user key information
  - Allow user to skip this step by entering "none"
  - If proper key is entered to edit, allow user to enter new value
  - Gather input and update value of user selected key
- Print final has program onto screen
=end

prospective_client = {}

puts "Please provide your full name:"
prospective_client[:name] = gets.chomp

puts "How old are you?"
prospective_client[:age] = gets.chomp.to_i

puts "How many children do you have?"
prospective_client[:children] = gets.chomp.to_i

puts "Do you prefer Modern, Traditional, Art Deco, Industrial, Rustic, or Mid-Century design? If other, please provide."
prospective_client[:theme] = gets.chomp

puts "Do you prefer Gray Scale or Colors?"
prospective_client[:color] = gets.chomp.downcase
  case prospective_client[:color]
  when "gray scale", "gray", "scale"
    prospective_client[:color] = false
  else 
    prospective_client[:color] = true
  end

puts "What is your budget for this project in dollars?"
prospective_client[:budget] = gets.chomp.gsub(/[^\d\.]/, '').to_f

puts "Thank you for providing the below information."
p prospective_client

puts "Would you like to edit any of your answers above before submitting? (y/n)"
edit = gets.chomp.downcase
  case edit
  when "n", "", nil
    puts "Great! Have a wonderful day!"
  when "y", "yes", "sure"
    puts "Which key would you like to update (name, age, children, theme, color, budget)?"
    edit_key = gets.chomp.to_sym
    puts "What would you like to update #{edit_key} to?"
    answer = ""
      if edit_key == :age || edit_key == :children
        answer = gets.chomp.to_i
      elsif edit_key == :budget
        answer = gets.chomp.gsub(/[^\d\.]/, '').to_f
      elsif edit_key == :color
        answer = gets.chomp
          if answer == "color" || aswer == "colors"
            answer = true
          else 
            answer = false
          end
      else
        answer = gets.chomp
      end
  prospective_client[edit_key] = answer
  puts "Thanks! Here is your updated information"
  end 
  p prospective_client

