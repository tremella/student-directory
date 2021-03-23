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

def input_students
  puts "Let's add some student info."
  students = []
  finished_listing = false
  while finished_listing == false
    puts "Student name?"
    name = gets.chomp # capitalize makes this "Name surname" so I didn't use it.
    puts "Student hobby?"
    hobby = gets.chomp.capitalize
    puts "Student nationality?"
    nationality = gets.chomp.capitalize
    students << {name: name, cohort: :November, hobby: hobby, nationality: nationality}
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