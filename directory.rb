@students = [] # an empty array accessible to all methods

def input_students
    puts "Please enter the first and second name of the student"
    name = gets.delete("\r\n")
   
   # students = []
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
            @students << {name: name, cohort: cohort, country: country, height: height, hobby: hobby}
                if @students.count > 1 
                    puts "Now we have #{@students.count} students" 
                else
                    puts "Now we have #{@students.count} student"
                end
            puts "Please add another student. If there are no more to add, hit return"
            #get another name from the user
            name = gets.delete("\r\n")
        end
   
end

def interactive_menu
    loop do
        print_menu
        process(gets.chomp)
    end
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv file"
    puts "9. Exit."
end

def show_students
    print_header
    print_students_list
    print_footer
end

def process(selection)   
    case selection
        when "1"
            input_students
        when "2"
            show_students
        when "3"
            save_students
        when "4"
            load_students
        when "9"
            exit # causes program to terminate
        else
            puts "I don't know what you mean, try again"
    end

end

def print_header
    puts "The Students of Villains Academy".center(100)
    puts "-------------".center(100)
end

def print_students_list
    if @students.count > 0
       
            existing_cohorts = @students.map {|student| student[:cohort]}.uniq
            existing_cohorts.each do |month|
            puts "#{month} cohort:"
                @students.each do |student| 
                    if student[:cohort] == month
                        puts "#{student[:name]} --> Born in #{student[:country]}, height: #{student[:height]} cm with a favourite hobby of #{student[:hobby]}."
       
                    end
                end
            end
  
    else
        puts "You didn't enter any students"
    
    end
end

def print_footer
    if @students.count > 1 
        puts "Overall, we have #{@students.count} great students"
    else
        puts "Overall, we have #{@students.count} great student"
    end
end

def save_students
    # open the file for writing
    file = File.open("students.csv", "w")
    # iterate over the students array
    @students.each do |student|
        student_data = [student[:name], student[:cohort]]
        csv_line = student_data.join(",")
        file.puts csv_line
    end
    file.close
end

def load_students
    file = File.open("students.csv", "r")
    file.readlines.each do |line|
        name, cohort = line.chomp.split(',')
        @students << {name: name, cohort: cohort.to_sym}
    end
    file.close
end

interactive_menu



