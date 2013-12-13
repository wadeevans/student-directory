
# Putting all the students into an array
students = [
{:name => "Dr. No", :cohort => :november},
{:name => "Caligula", :cohort => :november},
{:name => "Michael P. Jagger", :cohort => :november},
{:name => "William De Ath", :cohort => :november},
{:name => "Jiminy Cricket", :cohort => :november}
]

def print_header
	puts "The students of my cohort at Makers Academy"
	puts "----------------------"
end

def print(students)
	students.each do |student|
		puts "#{student[:name]} (#{student[:cohort]} cohort)"
	end
end

def print_footer(names)
	puts "Overall, we have #{names.length} great students"
end

# nothing happens until we call the methods

print_header
print(students)
print_footer(students)

