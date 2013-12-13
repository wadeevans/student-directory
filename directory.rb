
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
	students.each do |student|
		puts "#{student[:name]} (#{student[:cohort]} cohort)"
	end
end

def print_footer(names)
	puts "Overall, we have #{names.length} great students"
end

# nothing happens until we call the methods

students = input_students()
print_header
print_students(students)
print_footer(students)

