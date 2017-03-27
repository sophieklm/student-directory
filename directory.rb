require 'date'
#put students into a hash
def default_students
  students = [
  {name: "Dr. Hannibal Lecter",cohort: :november,  country: "USA", hobby: "cannibalism"},
  {name: "Darth Vader", cohort: :november,  country: "Space", hobby: "war"},
  {name: "Nurse Ratched", cohort: :november,  country: "Belarus", hobby: "kindness"},
  {name: "Michael Corleone", cohort: :november,  country: "Spain", hobby: "sport"},
  {name: "Alex DeLarge", cohort: :november, country: "France", hobby: "comedy"},
  {name: "The Wicked Witch of the West", cohort: :november ,country: "Oz", hobby: "magic"},
  {name: "Terminator", cohort: :november, country: "AI", hobby: "computers"},
  {name: "Freddy Krueger", cohort: :november, country: "Germany", hobby: "murder"},
  {name: "The Joker", cohort: :november, country: "Unknown", hobby: "magic"},
  {name: "Joffrey Baratheon", cohort: :november, country: "Westeros", hobby: "being annoying"},
  {name: "Norman Bates", cohort: :november, country: "America", hobby: "murder"}
]
end

def student_info
  puts "Name: "
  $name = gets.chomp
  puts "Cohort: "
  $cohort = gets.chomp
    if $cohort.empty?
      $cohort = :november
    elsif !(Date::MONTHNAMES.compact).include?($cohort)
      puts "That isn't a real month, try again"
      puts "Cohort: "
      $cohort = gets.chomp
    end
  puts "Country: "
  $country = gets.chomp
  puts "Hobby: "
  $hobby = gets.chomp
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, hit return twice"
  puts "A default student list will be used if no names are entered"
  #create empty array
  students = []
  #get info
  student_info
  #while name not empty, repeat
  while !$name.empty? do
    #add student hash to array
    students << {name: $name, cohort: $cohort.to_sym, country: $country, hobby: $hobby}
    puts "Now we have #{students.count} students"
    #get another name
    student_info
  end
  #return default list if no names entered
    if students.count == 0
      students = default_students
    end
  #return array of students
  students
end

def print_to_center(string)
  puts string.center(120)
end

def print_header
  puts print_to_center("The students of Villains Academy")
  puts print_to_center("-------------")
end

def print(students)
  count = 0
  while count < students.count
    puts print_to_center("#{count + 1}. #{students[count][:name]} (#{students[count][:cohort]} cohort) from #{students[count][:country]} likes #{students[count][:hobby]}")
    count += 1
  end
end

def print_footer(students)
  puts print_to_center("Overall, we have #{students.count} great students")
end

#call methods
students = input_students
print_header
print(students)
print_footer(students)
