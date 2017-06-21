def input_students
    puts "Please enter the first and second name of the student"
    name = gets.delete("\r\n")
   
    students = []
    months = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]

        while !name.empty? do
            puts "Thank you. Which cohort are they in?"
            cohort = gets.delete("\r\n").capitalize.to_sym
                
                if cohort.empty?
                    cohort = "July".to_sym 
                    puts "The cohort has reverted to the default of July." 
                end
                until months.include?(cohort)
                    puts "Please enter a valid month of the year"
                    cohort = gets.delete("\r\n").capitalize.to_sym
                end
        
            puts "Which country were they born in?"
            country = gets.delete("\r\n")
            puts "How tall are they in cm?"
            height = gets.delete("\r\n")
            puts "What is their favourite hobby?"
            hobby = gets.delete("\r\n")
   
        #add student hash to the array
            students << {name: name, cohort: cohort, country: country, height: height, hobby: hobby}
                if students.count > 1 
                    puts "Now we have #{students.count} students" 
                else
                    puts "Now we have #{students.count} student"
                end
            puts "Please add another student. If there are no more to add, hit return"
            #get another name from the user
            name = gets.delete("\r\n")
        end
    students
end


# def print_header
#     puts "The Students of Villains Academy".center(100)
#     puts "-------------".center(100)
# end

def print(students)
    if students.count > 0
    puts "The Students of Villains Academy".center(100)
    puts "-------------".center(100)
    existing_cohorts = students.map {|student| student[:cohort]}.uniq
    existing_cohorts.each do |month|
            puts "#{month} cohort:"
                students.each do |student| 
                    if student[:cohort] == month
                        puts "#{student[:name]} --> Born in #{student[:country]}, height: #{student[:height]} cm with a favourite hobby of #{student[:hobby]}."
       
                    end
                end
            end
    else
        puts "You didn't enter any students"
    end
end
 
def print_footer(students)
    if students.count > 1 
        puts "Overall, we have #{students.count} great students"
    else
        puts "Overall, we have #{students.count} great student"
    end
end

students = input_students
#print_header
print(students)
print_footer(students)


