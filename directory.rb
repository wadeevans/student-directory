
# Putting all the students into an array
students = [
"Dr. No",
"Caligula",
"Michael P. Jagger",
"William De Ath",
"Jiminy Cricket"
]

def print_header
	puts "The students of my cohort at Makers Academy"
	puts "----------------------"
end

def print(names)
	names.each do |name|
		puts name
	end
end

def print_footer(names)
	puts "Overall, we have #{names.length} great students"
end

# nothing happens until we call the methods

print_header
print(students)
print_footer(students)

