# students: Cruella De Vil, Hannibal Lecter, Hamburglar.

def print_header
  puts "The students of Villains Academy".center(35)
  puts "--------------------------------".center(35)
end

def print(students)
  if students.count == 1 && students[0][:name] == 'UNNAMED'
    puts "No students to print"
  else
    ctr = 0
    while ctr < students.count
      # still choosing to index at 1.
      puts " #{(ctr)+1}: #{students[ctr][:name]} (#{students[ctr][:cohort]} cohort). 
      Hobby: #{students[ctr][:hobby]}. Nationality: #{students[ctr][:nationality]}".center(50)
      ctr +=1
    end 
  end
end

# reusable function to prevent cohort selection errors
def validate_cohort_choice()
# Used twice: print_by_cohort() and input_students()
  valid_cohort_choice = false
  valid_cohorts = ["January", "February","March","April","May","June",
    "July","August","September","October","November","December"]
  while valid_cohort_choice == false
    puts "(Full month name, please)"
    cohort = default(gets.chomp.capitalize, "UNASSIGNED")
    if cohort == "UNASSIGNED" || valid_cohorts.include?(cohort)
      valid_cohort_choice = true
      return cohort
    end
  end
end

def print_by_cohort(students)
# this should take in a list of all existing students, 
# and print only the students of a selected cohort.
  puts "Which cohort would you like to print? \n (type a month, or press ENTER for UNASSIGNED)"
  cohort_to_print = validate_cohort_choice()
  puts "Students in the #{cohort_to_print} cohort:"
  students.each do |student| 
    if student[:cohort] == cohort_to_print.to_sym 
      puts "#{student[:name]}. Hobby: #{student[:hobby]}, Nationality: #{student[:nationality]}"
    end
  end
end

def print_footer(arr)
  if arr.count == 1 && arr[0][:name] == 'UNNAMED'
    puts "We have no diabolical students :( "
  else
  arr.count <= 1 ? (puts "Overall we have #{arr.count} diabolical student".center(40)) : (puts "Overall we have #{arr.count} diabolical students".center(40))
  end
end

# this creates the array of students
def input_students
  puts "Let's add some student info."
  students = []
  finished_listing = false
  
  # this is to handle blank values
  def default(attribute, default_value) 
    if attribute == ''
      return default_value
    else
      return attribute
    end
  end
  
  while finished_listing == false
    puts "Student name?"
    s_name = default(gets.strip, "UNNAMED") # this is a helper function 
    puts "Student cohort?"
    s_cohort = validate_cohort_choice() # this is a different helper function
    puts "Student hobby?"
    s_hobby = default(gets.strip.capitalize, "UNKNOWN") # helper func
    puts "Student nationality?"
    s_nationality = default(gets.strip.capitalize, "UNKNOWN") # helper func
    students << {name: s_name, cohort: s_cohort.to_sym, hobby: s_hobby, nationality: s_nationality}
    students.count <= 1 ? (puts "Now we have #{students.count} student") : (puts "Now we have #{students.count} students")
    puts "Finished adding students? if so, press 'y' - if not, press any other key."
    finished = gets.strip.downcase
    if finished == 'y'
      finished_listing = true
    end
  end
  students
end

def interactive_menu
  students = []
  loop do
    puts "1. input students"
    puts "2. display all students"
    puts "9. exit"
    selection = gets.chomp
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit
      else
        puts "invalid input, try again"
    end
  end
end

interactive_menu()



