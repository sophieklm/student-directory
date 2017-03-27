#put students into a hash
default_students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

def input_students
  puts "Please enter the names of the students"
  puts "To finish, hit return twice"
  #create empty array
  students = []
  #get first name
  name = gets.chomp
  #while name not empty, repeat
  while !name.empty? do
    #add student hash to array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name
    name = gets.chomp
  end
  #return array of students
  students
end

def print_header
  puts "The students of Villains Academy whose names are less than #{$char_num} characters:"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_with_letter(students, letter)
  students.each_with_index do |student, index|
    if student[:name][0] == letter
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    else
    end
  end
end

def print_num_chars(students, chars)
  students.each_with_index do |student, index|
    if student[:name].length < chars
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    else
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

#call methods
students = default_students

#puts "Enter a letter:"
#$first_letter = gets.chomp.upcase
$char_num = 12

print_header
#print(students)
#print_with_letter(students, $first_letter)
print_num_chars(students, $char_num)
print_footer(students)
