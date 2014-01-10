#start of project section 2

@students = []

# Load file from command line argument if one given and file exists
def try_load_students
	filename = ARGV.first # first? argument from the command line
	return if filename.nil? # get out of this method if no filename given
	if File.exists?(filename)
		load_students(filename)
		puts "Loaded #{@students.length} students from #{filename}"
	else # if file named doesn't exist
		puts "Sorry, #{filename} does not exist."
		exit # quit programme (do we want to do this??)
	end
end




# Interactive_menu
def interactive_menu
	# students = []
	loop do
		# 1. print menu and ask the user what to do
		print_menu()
		# 2. read the input and save it into a variable
		selection = STDIN.gets.chomp()
		# 3. do what has been asked
		process(selection)
	end
end

def print_menu
	# print the menu and ask the user what to do
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save the list to students.csv"
	puts "4. Load the list from students.csv"
	puts "9. Exit"
end


# Process menu selections
def process(selection)
	case selection
	when "1"
		# input the students
		@students = input_students
	when "2"
		# show the students
		show_students()
	when "3"
		save_students
	when "4"
		load_students
	when "9"
		# exit
		exit
	else
		puts "I don't understand, please try again"
	end
end

# Menu Options

# method to add students add attributes
def input_students
	printf "Please enter the student names\n"
	puts "Hit return twice to quit entering names"
	# create an empty array
	# students = []
	# get the first name and strip the newline from it
	# name = gets.chomp
	name = STDIN.gets.delete "\n"


	# while name is not empty (return twice) run this loop
	while !name.empty? do
		puts "Please enter the cohort or hit return to enter default :january"
		cohort = STDIN.gets.chomp.to_sym
		if cohort.empty?
			cohort = :january
		end

		puts "Please enter the country of origin or hit return to enter default :uk"
		country = STDIN.gets.chomp.to_sym
		if country.empty?
			country = :uk
		end
		# shovel (<<) student hash into array
		@students << {:name => name, :cohort => cohort, :country => country}
		if @students.length == 1
			puts "Now we have #{@students.length} student"
		else
			puts "Now we have #{@students.length} students"
		end

		# get another name
		puts "Please enter another name or hit return to quit"
		name = STDIN.gets.chomp
	end
	# return the completed array of students
	@students
end

def show_students
	# show the students
	print_header
	print_students()
	print_footer()
end

# Print header
def print_header
	puts "The students of my cohort at Makers Academy"
	puts "----------------------"
end
# main print method for showing students
def print_students()
	@students.each_with_index do |student, index|
		puts "#{index + 1}: " + "#{student[:name]}".center(20) + " (#{student[:cohort]} cohort)"
	end
end
# Print footer
def print_footer()
	if @students.length == 1
		puts "Overall, we have #{@students.length} great student"
	else
		puts "Overall, we have #{@students.length} great students"
	end
end

# Save student list to CSV file
def save_students
	# open the file for writing
	file = File.open("students.csv", "w")
	# iterate over the array of students
	@students.each do |student|
		student_data = [student[:name], student[:cohort]]
		csv_line = student_data.join(",")
		file.puts csv_line
	end
	file.close
end

# Load students.csv file to @students array
def load_students(filename = "students.csv")
	file = File.open(filename, "r")
	file.readlines.each do |line|
		name, cohort = line.chomp.split(',')
		@students << {:name => name, :cohort => cohort.to_sym}
	end
	file.close
end

# alternative methods for showing students and attributes
def print_students_in_cohorts()

	cohorts = @students.map { |x| x[:cohort]}.uniq

	puts cohorts
	i = 0
	while i < cohorts.length
		@students.each_with_index do |student, index|[:cohort]
			if student[:cohort] == cohorts[i]
				puts "#{index + 1}: " + "#{student[:name]}".center(20) + " (#{student[:cohort]} cohort) (country of origin: #{student[:country]})"
			end
		end

		i += 1
	end

	
end
# alternative methods for showing students and attributes
def print_students_using_center()
	@students.each_with_index do |student, index|
		puts "#{index + 1}: " + "#{student[:name]}".center(20) + " (#{student[:cohort]} cohort) (country of origin: #{student[:country]})"
	end
end
# alternative methods for showing students and attributes
def print_students_using_while()
	i = 0
	while i < @students.length
		puts "#{i + 1}: #{@students[i][:name]} (#{@students[i][:cohort]} cohort)} "
		i += 1
	end
end
# alternative methods for showing students and attributes
def print_students_beginning_with_A()
	@students.each_with_index do |student, index|
		if student[:name][0] == 'A'
			puts "#{index + 1}: #{student[:name]} (#{student[:cohort]} cohort)"
		end
	end
end
# alternative methods for showing students and attributes
def print_students_with_less_than_12_chars()
	@students.each_with_index do |student, index|
		if student[:name].length < 12
			puts "#{index + 1}: #{student[:name]} (#{student[:cohort]} cohort)"
		end
	end
end



try_load_students()
interactive_menu()
# nothing happens until we call the methods

# students = input_students()
# print_header
# print_students(students)
# uncomment the lines below to test other methods
# print_students_beginning_with_A(students)
# print_students_with_less_than_12_chars(students)
# print_students_using_while(students)
# print_students_using_center(students)
# print_students_in_cohorts(students)
# print_footer(students)

