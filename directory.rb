# template students

# students = [
# {name: "Hannibal Lecter", cohort: :november},
# {name: "Cruella De Vil", cohort: :november}]


def print_header
  puts "The students of Villains Academy".center(35)
  puts "--------------------------------".center(35)
end

def print(students)
  ctr = 0
  while ctr < students.count
    # still choosing to index at 1.
    puts " #{(ctr)+1}: #{students[ctr][:name]} (#{students[ctr][:cohort]} cohort). 
    Hobby: #{students[ctr][:hobby]}. Nationality: #{students[ctr][:nationality]}".center(50)
    ctr +=1
  end  
end

def print_footer(names)
  puts "Overall we have #{names.count} diabolical students".center(40)
end
# default values
# (name="unnamed", cohort="unassigned", hobby="unknown", nationality="unknown")
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
    s_name = default(gets.chomp, "UNNAMED")
    # to be tricky, we *could* validate the attribute by assigning the outcome of a TERN to it.
    # name = gets.chomp
    # name = (name == '') ? 'UNNAMED' : name 
    # now to handle cohort
    valid_cohort_choice = false
    valid_cohorts = ["January", "February","March","April","May","June",
      "July","August","September","October","November","December"]
    while valid_cohort_choice == false
      puts "Student cohort?"
      s_cohort = default(gets.chomp.capitalize, "UNASSIGNED")
      if s_cohort == "UNASSIGNED" || valid_cohorts.include?(s_cohort)
        valid_cohort_choice = true
      end
    end
    puts "Student hobby?"
    s_hobby = default(gets.chomp.capitalize, "UNKNOWN")
    puts "Student nationality?"
    s_nationality = default(gets.chomp.capitalize, "UNKNOWN")
    students << {name: s_name, cohort: s_cohort.to_sym, hobby: s_hobby, nationality: s_nationality}
    puts "Finished adding students? if so, press 'y' - if not, press any other key."
    finished = gets.chomp.downcase
    if finished == 'y'
      finished_listing = true
    end
  end
  students
end
  
students = input_students
print_header
print(students)
print_footer(students)