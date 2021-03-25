# students: Cruella De Vil, Hannibal Lecter, Hamburglar.
@students = []
def print_header
  puts "The students of Villains Academy".center(35)
  puts "--------------------------------".center(35)
end

def print_students_list
  if @students.count == 1 && @students[0][:name] == 'UNNAMED'
    puts "No students to print"
  else
    ctr = 0
    while ctr < @students.count
      # still choosing to index at 1.
      puts " #{(ctr)+1}: #{@students[ctr][:name]} (#{@students[ctr][:cohort]} cohort). 
      Hobby: #{@students[ctr][:hobby]}. Nationality: #{@students[ctr][:nationality]}".center(50)
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

def print_by_cohort
# this should take in a list of all existing students, 
# and print only the students of a selected cohort.
  puts "Which cohort would you like to print? \n (type a month, or press ENTER for UNASSIGNED)"
  cohort_to_print = validate_cohort_choice()
  puts "Students in the #{cohort_to_print} cohort:"
  @students.each do |student| 
    if student[:cohort] == cohort_to_print.to_sym 
      puts "#{student[:name]}. Hobby: #{student[:hobby]}, Nationality: #{student[:nationality]}"
    end
  end
end

def print_footer
  if @students.count == 1 && @students[0][:name] == 'UNNAMED'
    puts "We have no diabolical students :( "
  else
  @students.count <= 1 ? (puts "Overall we have #{@students.count} diabolical student".center(40)) : (puts "Overall we have #{@students.count} diabolical students".center(40))
  end
end

# this creates the array of students
def input_students
  puts "Let's add some student info."
  # students = [] # we made this global in line 1
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
    @students << {name: s_name, cohort: s_cohort.to_sym, hobby: s_hobby, nationality: s_nationality}
    @students.count <= 1 ? (puts "Now we have #{@students.count} student") : (puts "Now we have #{@students.count} students")
    puts "Finished adding students? if so, press 'y' - if not, press any other key."
    finished = gets.strip.downcase
    if finished == 'y'
      finished_listing = true
    end
  end
  # students # this is now a global variable
end

def save_students
  file = File.open("students.csv","w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobby], student[:nationality]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort, hobby, nationality = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym, hobby: hobby, nationality: nationality}
  end
  file.close
end

def print_menu
    puts "1. input students"
    puts "2. display all students"
    puts "3. save the list of students to students.csv"
    puts "4. load the list of students from students.csv"
    puts "9. exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "Invalid input, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu()



