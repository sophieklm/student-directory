#put students into an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
#print student list
puts "The students of Villains Academy"
puts "-------------"
students.each do |student|
  puts student
end
#print the total number of students
puts "Overall, we have #{students.count} great students"
