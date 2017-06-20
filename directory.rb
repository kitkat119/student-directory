def input_students
    puts "Please enter the first and second name of the student"
    name = gets.chomp
   
    students = []
   
        while !name.empty? do
            puts "Thank you. Which cohort are they in?"
            cohort = gets.chomp.capitalize.to_sym
                
            months = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
                if cohort.empty?
                    cohort = "July".to_sym 
                    puts "The cohort has reverted to the default of July." 
                end
                until months.include?(cohort)
                    puts "Please enter a valid month of the year"
                    cohort = gets.chomp.capitalize.to_sym
                end
        
            puts "Which country were they born in?"
            country = gets.chomp
            puts "How tall are they in cm?"
            height = gets.chomp
            puts "What is their favourite hobby?"
            hobby = gets.chomp
   
        #add student hash to the array
            students << {name: name, cohort: cohort, country: country, height: height, hobby: hobby}
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


