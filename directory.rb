# students: Cruella De Vil, Hannibal Lecter, Hamburglar.
require 'csv'
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
      puts "\n"
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
    cohort = default(STDIN.gets.chomp.capitalize, "UNASSIGNED")
    if cohort == "UNASSIGNED" || valid_cohorts.include?(cohort)
      valid_cohort_choice = true
      return cohort
    end
  end
end

def choose_filename()
  puts "filename please"
  choice = gets.chomp
  choice
end

# commented out because it seems un-needed by future activities
# consider re-integrating.

# def print_by_cohort
# # this should take in a list of all existing students, 
# # and print only the students of a selected cohort.
#   puts "Which cohort would you like to print? \n (type a month, or press ENTER for UNASSIGNED)"
#   cohort_to_print = validate_cohort_choice()
#   puts "Students in the #{cohort_to_print} cohort:"
#   @students.each do |student| 
#     if student[:cohort] == cohort_to_print.to_sym 
#       puts "#{student[:name]}. Hobby: #{student[:hobby]}, Nationality: #{student[:nationality]}"
#     end
#   end
# end

def print_footer
  if @students.count == 1 && @students[0][:name] == 'UNNAMED'
    puts "We have no diabolical students :( \n "
  else
  @students.count <= 1 ? (puts "Overall we have #{@students.count} diabolical student \n".center(40)) : (puts "Overall we have #{@students.count} diabolical students".center(40))
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
  ## START EDITS
  while finished_listing == false
    puts "Student name?"
    s_name = default(STDIN.gets.strip, "UNNAMED") # this is a helper function 
    puts "Student cohort?"
    s_cohort = validate_cohort_choice() # this is a different helper function
    puts "Student hobby?"
    s_hobby = default(STDIN.gets.strip.capitalize, "UNKNOWN") # helper func
    puts "Student nationality?"
    s_nationality = default(STDIN.gets.strip.capitalize, "UNKNOWN") # helper func
    merge_into_students_arr(s_name, s_cohort, s_hobby, s_nationality) # this adds the data.
    @students.count <= 1 ? (puts "Now we have #{@students.count} student") : (puts "Now we have #{@students.count} students")
    puts "Finished adding students? if so, press 'y' - if not, press any other key."
    finished = STDIN.gets.strip.downcase
    if finished == 'y'
      finished_listing = true
    end
  end
  # students # this is now a global variable
end

def save_students
  filename = choose_filename()
  file = File.open(filename,"w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobby], student[:nationality]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  puts "saved #{@students.count} students to students.csv"
  file.close
end

def merge_into_students_arr(n,c,h,nat)
  @students << {name: n, cohort: c.to_sym, hobby: h, nationality: nat} # helper function to merge student to students arr
end

# this is no longer in the options menu, but is still important elsewhere
# it includes a default value, too. 
def load_students()
  filename = choose_filename()
  if !(File.exists?(filename))
    puts "invalid choice"
    exit
  end
  file = CSV.read(filename)
  puts file[0].class
  file.each do |line|
    merge_into_students_arr(line[0],line[1],line[2],line[3])
  end
  puts "Success - loaded more students"
end

def try_load_students # based around optional ARGV on command line
  filename = ARGV.first # first arg from command line
  # return if filename.nil? # exit early if no ARGV given
  # commented out so students.csv is default if no file given
  if filename.nil?
    filename = "students.csv"
  end
  if File.exists?(filename) 
    load_students()
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

def print_menu
    puts "1. input students"
    puts "2. display all students"
    puts "3. save the list of students to (input file name)"
    puts "4. load the list of students from (input file name)"
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
    process(STDIN.gets.chomp)
  end
end

interactive_menu


