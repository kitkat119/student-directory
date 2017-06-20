#Let's put all students into an array
# students = [
#     {name: "Dr Hannibal Lecter", cohort: :november },
#     {name: "Darth Vader", cohort: :november },
#     {name:"Nurse Ratched", cohort: :november },
#     {name: "Michael Corleone", cohort: :november },
#     {name: "Alex DeLarge", cohort: :november },
#     {name: "The Wicked Witch of the West", cohort: :november },
#     {name: "Terminator", cohort: :november },
#     {name: "Freddy Krueger", cohort: :november },
#     {name: "The Joker", cohort: :november },
#     {name: "Joffrey Baratheon", cohort: :november },
#     {name: "Norman Bates", cohort: :november }
#     ]

    
def input_students
    puts "Please enter the first and second name of the student"
    name = gets.chomp
   
    #create an empty array
    students = []
    # while the name is NOT empty, repeat this code
        while !name.empty? do
            puts "Thank you. Which country were they born in?"
            country = gets.chomp
            puts "How tall are they in cm?"
            height = gets.chomp
            puts "What is their favourite hobby?"
            hobby = gets.chomp
   
        #add student hash to the array
            students << {name: name, cohort: :november, country: country, height: height, hobby: hobby}
                if students.count > 1 
                    puts "Now we have #{students.count} students" 
                else
                    puts "Now we have #{students.count} student"
                end
            puts "Please add another student. If there are no more to add, hit return"
            #get another name from the user
            name = gets.chomp
        end
    students
end

def print_header
    puts "The Students of Villains Academy".center(100)
    puts "-------------".center(100)
end

def print(students)
    count = 0
    while count < students.count
        puts "#{count+1}. #{students[count][:name]} (#{students[count][:cohort]} cohort):".ljust(50) + "Born in #{students[count][:country]}, height: #{students[count][:height]} cm with a favourite hobby of #{students[count][:hobby]}.".rjust(50)
        count += 1
    end
end
 
def print_footer(students)
    puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)


