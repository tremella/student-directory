# first, let's print the list of students

students = [
'Dr Hannibal Lecter',
'Darth Vader',
'Annie Wilkes',
'Dr Olivia Octavius',
'Bill Cypher',
'Dolores Umbridge',
'Cruella De Vil',
'Randall Flagg',
'Poison Ivy',
'Joffrey Baratheon',
'Raoul Silva']


def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

def print(names)
  names.each do |name|
    puts name
  end
end

def print_footer(names)
  puts "Overall we have #{names.count} students" 
end

print_header
print(students)
print_footer(students)