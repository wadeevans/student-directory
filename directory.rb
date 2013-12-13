
# Putting all the students into an array
old_students = [
{:name => "Dr. No", :cohort => :november},
{:name => "Caligula", :cohort => :november},
{:name => "Michael P. Jagger", :cohort => :november},
{:name => "William De Ath", :cohort => :november},
{:name => "Jiminy Cricket", :cohort => :november}
]

def input_students
	print "Please enter the student names\n"
	puts "Hit return twice to quit entering names"
	# create an empty array
	students = []
	# get the first name and strip the newline from it
	name = gets.chomp
	# while name is not empty (return twice) run this loop
	while !name.empty? do
		# shovel (<<) student hash into array
		students << {:name => name, :cohort => :november}
		if students.length == 1
			puts "Now we have #{students.length} student"
		else
			puts "Now we have #{students.length} students"
		end

		# get another name
		puts "Please enter another name or hit return to quit"
		name = gets.chomp
	end
	# return the completed array of students
	students
end


def print_header
	puts "The students of my cohort at Makers Academy"
	puts "----------------------"
end

def print_students(students)
	students.each_with_index do |student, index|
		puts "#{index + 1}: #{student[:name]} (#{student[:cohort]} cohort)"
	end
end

def print_students_using_while(students)
	i = 0
	while i < students.length
		puts "#{i + 1}: #{students[i][:name]} (#{students[i][:cohort]} cohort)} "
		i += 1
	end
end

def print_students_beginning_with_A(students)
	students.each_with_index do |student, index|
		if student[:name][0] == 'A'
			puts "#{index + 1}: #{student[:name]} (#{student[:cohort]} cohort)"
		end
	end
end

def print_students_with_less_than_12_chars(students)
	students.each_with_index do |student, index|
		if student[:name].length < 12
			puts "#{index + 1}: #{student[:name]} (#{student[:cohort]} cohort)"
		end
	end
end

def print_footer(students)
	if students.length == 1
		puts "Overall, we have #{students.length} great student"
	else
		puts "Overall, we have #{students.length} great students"
	end
end

# nothing happens until we call the methods

students = input_students()
print_header
print_students(students)
# uncomment the lines below to test other methods
# print_students_beginning_with_A(students)
# print_students_with_less_than_12_chars(students)
# print_students_using_while(students)
print_footer(students)

