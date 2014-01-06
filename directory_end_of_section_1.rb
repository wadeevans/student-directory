# Directory at end of project assignment 1

# method to add students add attributes
def input_students
	printf "Please enter the student names\n"
	puts "Hit return twice to quit entering names"
	# create an empty array
	students = []
	# get the first name and strip the newline from it
	# name = gets.chomp
	name = gets.delete "\n"


	# while name is not empty (return twice) run this loop
	while !name.empty? do
		puts "Please enter the cohort or hit return to enter default :january"
		cohort = gets.chomp.to_sym
		if cohort.empty?
			cohort = :january
		end

		puts "Please enter the country of origin or hit return to enter default :uk"
		country = gets.chomp.to_sym
		if country.empty?
			country = :uk
		end
		# shovel (<<) student hash into array
		students << {:name => name, :cohort => cohort, :country => country}
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
# main print method for showing students
def print_students(students)
	students.each_with_index do |student, index|
		puts "#{index + 1}: " + "#{student[:name]}".center(20) + " (#{student[:cohort]} cohort)"
	end
end
# alternative methods for showing students and attributes
def print_students_in_cohorts(students)

	cohorts = students.map { |x| x[:cohort]}.uniq

	puts cohorts
	i = 0
	while i < cohorts.length
		students.each_with_index do |student, index|[:cohort]
			if student[:cohort] == cohorts[i]
				puts "#{index + 1}: " + "#{student[:name]}".center(20) + " (#{student[:cohort]} cohort) (country of origin: #{student[:country]})"
			end
		end

		i += 1
	end

	
end
# alternative methods for showing students and attributes
def print_students_using_center(students)
	students.each_with_index do |student, index|
		puts "#{index + 1}: " + "#{student[:name]}".center(20) + " (#{student[:cohort]} cohort) (country of origin: #{student[:country]})"
	end
end
# alternative methods for showing students and attributes
def print_students_using_while(students)
	i = 0
	while i < students.length
		puts "#{i + 1}: #{students[i][:name]} (#{students[i][:cohort]} cohort)} "
		i += 1
	end
end
# alternative methods for showing students and attributes
def print_students_beginning_with_A(students)
	students.each_with_index do |student, index|
		if student[:name][0] == 'A'
			puts "#{index + 1}: #{student[:name]} (#{student[:cohort]} cohort)"
		end
	end
end
# alternative methods for showing students and attributes
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
# print_students_using_center(students)
# print_students_in_cohorts(students)
print_footer(students)

