
# Putting all the students into an array
students = [
"Dr. No",
"Caligula",
"Michael P. Jagger",
"William De Ath",
"Jiminy Cricket"
]


# and then print the list of students
puts "The students of my cohort at Makers Academy"
puts "----------------------"
students.each do |student|
	puts student
end

# then we print the total
puts "Overall, we have #{students.length} great students"


