def process_employee

puts "What is your name?"
  employee_name = gets.chomp
    case employee_name
    when "Drake Cula", "Tu Fang"
      vampire_name = true
    else
      vampire_name = false
     end

puts "How old are you?"
  employee_age = gets.chomp.to_i

puts "What year were you born?"
  employee_year_born = gets.chomp.to_i
  current_year = 2017
  confirm_age = current_year - employee_year_born
    if confirm_age == employee_age
      confirm_age = true
    else 
      confirm_age = false 
    end

puts "Our company cafeteria serves garlic bread. Should we order some for you?"
  likes_garlic_bread = gets.chomp.downcase
    case likes_garlic_bread
    when "yes", "sure", "absolutely", "please", "y", "yes please", "of course"
      likes_garlic_bread = true
    else
      likes_garlic_bread = false
    end

puts "Would you like to enroll in the company's health insurance?"
  needs_health_insurance = gets.chomp.downcase
    case needs_health_insurance
    when "yes", "sure", "of course", "absolutely", "yes please", "y"
      needs_health_insurance = true
    else
      needs_health_insurance = false
    end

puts "THE RESULTS ARE IN!"

  if vampire_name == true
    puts "Definitely a vampire!"
  elsif confirm_age == false && likes_garlic_bread == false && needs_health_insurance == false
    puts "Almost certainly a vampire."
  elsif confirm_age != true && (likes_garlic_bread != true || needs_health_insurance != true)
    puts "Probably a vampire."
  elsif confirm_age == true && (likes_garlic_bread == true || needs_health_insurance == false)
    puts "Probably not a vampire."
  else
    puts "Results inconclusive."
  end
end

p process_employee





