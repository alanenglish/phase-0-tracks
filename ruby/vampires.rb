def process_employee  

  # Ask how many employees will be processed in order to initiate loop #
  puts "How many employees will be processed today?"
  employee_count = gets.chomp.to_i
  
  # Create loop to process multiple employees #
  until employee_count == 0

    # Obtain applicant name, store variable and convert to boolean #
    puts "What is your name?"
    employee_name = gets.chomp.downcase
      case employee_name
      when "drake cula", "tu fang"
        vampire_name = true
      else
        vampire_name = false
      end

    # Obtain applicant age, store variable and convert to integer #
    puts "How old are you?"
    employee_age = gets.chomp.to_i

    # Obtain applicant year of birth, store variable and convert to integer #
    puts "What year were you born?"
    employee_year_born = gets.chomp.to_i
    current_year = 2017
    # Convert age variable to boolean #
    confirm_age = current_year - employee_year_born
      if confirm_age == employee_age
        confirm_age = true
      else 
        confirm_age = false 
      end

    # Obtain information on garlic bread, store variable and convert to boolean #
    puts "Our company cafeteria serves garlic bread. Should we order some for you?"
    likes_garlic_bread = gets.chomp.downcase
      case likes_garlic_bread
      when "yes", "sure", "absolutely", "please", "y", "yes please", "of course", "yeah", "yea"
        likes_garlic_bread = true
      else
        likes_garlic_bread = false
      end

    # Obtain information on health insurance, store variable and convert to boolean #
    puts "Would you like to enroll in the company's health insurance?"
    needs_health_insurance = gets.chomp.downcase
      case needs_health_insurance
      when "yes", "sure", "absolutely", "please", "y", "yes please", "of course", "yeah", "yea"
        needs_health_insurance = true
      else
        needs_health_insurance = false
      end

    # Obtain list of suspicious allergies #
    puts "Please list any allergies you have. When finished, please type 'done'."
    allergy_suspicion = nil
      until allergy_suspicion == "done" || allergy_suspicion == "sunshine"
      allergy_suspicion = gets.chomp.downcase
      end  

    # Use conditional logic to determine whether applicant is a vampire #
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
  
    # Decrease number of applications to process for loop #
    employee_count -= 1
      if employee_count != 0
        puts "Lets process your next employee!"
      end
  end
  # Add friendly message #
  puts  "Actually, never mind! What do these questions have to do with anything? Let's all be friends."
end

p process_employee