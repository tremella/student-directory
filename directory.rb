# first, let's print the list of students

students = [
{name: "Dolores Umbridge", cohort: :november},
{name: "Hannibal Lecter", cohort: :november},
{name: "Olivia Octavius", cohort: :november},
{name: "Cruella De Vil", cohort: :november},
{name: "Randall Flagg", cohort: :november},
{name: "Annie Wilkes", cohort: :november},
{name: "Tyrone Rugen", cohort: :november},
{name: "Darth Vader", cohort: :november},
{name: "Raoul Silva", cohort: :november},
{name: "Bill Cypher", cohort: :november}]


def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall we have #{names.count} students" 
end

print_header
print(students)
print_footer(students)