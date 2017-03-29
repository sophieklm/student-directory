require 'date'
require 'active_support/inflector'

@students = []

def interactive_menu
  loop do
    print_menu
    #read input and save as variable
    process(gets.chomp)
    #do what user has asked
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1" #input students
    input_students
  when "2" #show students
    show_students
  when "9" #terminate program
    exit
  else
    puts "I don't understand that, please try again"
  end
end

def show_students
  if @students.count == 0
    puts "There are no students at Villains Academy"
  else
    print_header
    print_students_list
    print_footer
  end
end

#put default students into a hash
def default_students
  students = [
  {name: "Dr. Hannibal Lecter",cohort: :june,  country: "USA", hobby: "cannibalism"},
  {name: "Darth Vader", cohort: :may,  country: "Space", hobby: "war"},
  {name: "Nurse Ratched", cohort: :november,  country: "Belarus", hobby: "kindness"},
  {name: "Michael Corleone", cohort: :october,  country: "Spain", hobby: "sport"},
  {name: "Alex DeLarge", cohort: :november, country: "France", hobby: "comedy"},
  {name: "The Wicked Witch of the West", cohort: :november ,country: "Oz", hobby: "magic"},
  {name: "Terminator", cohort: :november, country: "AI", hobby: "computers"},
  {name: "Freddy Krueger", cohort: :november, country: "Germany", hobby: "murder"},
  {name: "The Joker", cohort: :november, country: "Unknown", hobby: "magic"},
  {name: "Joffrey Baratheon", cohort: :may, country: "Westeros", hobby: "being annoying"},
  {name: "Norman Bates", cohort: :june, country: "America", hobby: "murder"}
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
  puts "Please enter the details of the students"
  puts "To finish, hit return twice"
  puts "A default student list will be used if no names are entered"
  #get info
  student_info
  #while name not empty, repeat
  while !$name.empty? do
    #add student hash to array
    @students << {name: $name, cohort: $cohort.to_sym, country: $country, hobby: $hobby}
    puts "Now we have #{@students.count} students"
    #get another name
    student_info
  end
  #return default list if no names entered
    if @students.count == 0
      @students = default_students
    end
  #return array of students
  @students
end

def sort_by_cohort
  cohort_list = []
  @students.map do |student|
    cohort_list << Date::MONTHNAMES.index(student[:cohort].capitalize.to_s)
  end
  cohort_list.uniq.sort
end

def print_to_center(string)
  puts string.center(120)
end

def print_header
  puts print_to_center("The students of Villains Academy")
end

def print_students_list
  $cohort = sort_by_cohort
  $cohort.each do |month|
    month_name = Date::MONTHNAMES[month]
    puts print_to_center("-------------")
    puts print_to_center("#{month_name} cohort")
    puts print_to_center("-------------")
    count = 0
    @students.each do |student|
      if Date::MONTHNAMES.index(student[:cohort].capitalize.to_s) == month
        puts print_to_center("#{count + 1}. #{student[:name]} (#{student[:cohort]} cohort) from #{student[:country]} likes #{student[:hobby]}")
        count += 1
      end
    end
  end
end

def print_footer
  puts print_to_center("-------------")
  puts print_to_center("Overall, we have #{@students.count} great " + "student".pluralize(@students.count) + " from #{$cohort.count} " + "cohort".pluralize($cohort.count))
end

#call method
interactive_menu
