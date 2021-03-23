# first, let's print the list of students

# students = [
# {name: "Hannibal Lecter", cohort: :november},
# {name: "Olivia Octavius", cohort: :november},
# {name: "Cruella De Vil", cohort: :november},
# {name: "Raoul Silva", cohort: :november},
# {name: "Bill Cypher", cohort: :november}]


def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end


def print(students)
  ctr = 0
  while ctr < students.count
    # still choosing to index at 1.
    puts " #{(ctr)+1}: #{students[ctr][:name]} (#{students[ctr][:cohort]} cohort)"
    ctr +=1
  end  
end


def print_footer(names)
  puts "Overall we have #{names.count} diabolical students"
end

def input_students
puts "Please enter the names of the students"
puts "to finish, just hit return (enter) twice"
students = []
#get first name
name = gets.chomp
#while name isn't an empty string, keep asking for more.
while !name.empty? do 
  students << {name: name, cohort: :november}
  puts "now we have #{students.count} students"
  # get another student - and make name empty (loop breaks)
  name = gets.chomp
end
students
end
students = input_students
print_header
print(students)
print_footer(students)