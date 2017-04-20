def process_employee  

  puts "How many employees will be processed today?"
  employee_count = gets.chomp.to_i

  until employee_count == 0
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

    puts "Please list any allergies you have. When finished, please type 'done'."
    allergy_suspicion = nil
      until allergy_suspicion == "done" || allergy_suspicion == "sunshine"
      allergy_suspicion = gets.chomp
      end  

    puts "THE RESULTS ARE IN! WE'VE CONCLUDED THE APPLICANT IS:"
      if vampire_name
        puts "Definitely a vampire!"
      elsif !confirm_age && !likes_garlic_bread && !needs_health_insurance
        puts "Almost certainly a vampire."  
      elsif allergy_suspicion == "sunshine" || (!confirm_age && (!likes_garlic_bread || !needs_health_insurance))
        puts "Probably a vampire."
      elsif confirm_age && (likes_garlic_bread || needs_health_insurance)
        puts "Probably not a vampire."
      else
        puts "Results inconclusive."
      end
  
    employee_count -= 1
      if employee_count != 0
        puts "Lets process your next employee!"
      end
  end
end

p process_employee