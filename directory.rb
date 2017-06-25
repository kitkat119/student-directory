@students = [] # an empty array accessible to all methods

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv file"
    puts "9. Exit."
end

def interactive_menu
    loop do
        print_menu
        process(STDIN.gets.chomp)
    end
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

def input_students
    puts "Please enter the first and second name of the student"
    name = STDIN.gets.delete("\r\n")
   
   # students = []
    months = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]

        while !name.empty? do
            puts "Thank you. Which cohort are they in?"
            cohort = STDIN.gets.delete("\r\n").capitalize.to_sym
                
                if cohort.empty?
                    cohort = "July".to_sym 
                    puts "The cohort has reverted to the default of July." 
                end
                until months.include?(cohort)
                    puts "Please enter a valid month of the year"
                    cohort = STDIN.gets.delete("\r\n").capitalize.to_sym
                end
        
            puts "Which country were they born in?"
            country = STDIN.gets.delete("\r\n")
            puts "How tall are they in cm?"
            height = STDIN.gets.delete("\r\n")
            puts "What is their favourite hobby?"
            hobby = STDIN.gets.delete("\r\n")
   
        #add student hash to the array
            add_to_students_array(name, cohort, country, height, hobby)
            #@students << {name: name, cohort: cohort, country: country, height: height, hobby: hobby}
                if @students.count > 1 
                    puts "Now we have #{@students.count} students" 
                else
                    puts "Now we have #{@students.count} student"
                end
            puts "Please add another student. If there are no more to add, hit return"
            #get another name from the user
            name = STDIN.gets.delete("\r\n")
        end
   
end

def add_to_students_array(name, cohort, country, height, hobby)
    @students << {name: name, cohort: cohort, country: country, height: height, hobby: hobby}
end

def show_students
    print_header
    print_students_list
    print_footer
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
        student_data = [student[:name], student[:cohort], student[:country], student[:height], student[:hobby]]
        csv_line = student_data.join(",")
        file.puts csv_line
    end
    file.close
end

def load_students(filename = "students.csv")
    file = File.open(filename, "r")
    file.readlines.each do |line|
        name, cohort, country, height, hobby = line.chomp.split(',')
        add_to_students_array(name, cohort, country, height, hobby)
      end
    file.close
     puts "Loaded #{@students.count} from #{filename}"
end

def try_load_students
    filename = ARGV.first   # first arg from the command line
    if filename.nil? 
        load_students 
    elsif File.exists?(filename)   # if it exists
        load_students(filename)
        puts "Loaded #{@students.count} from #{filename}"
    else
        puts "Sorry, #{filename} does not exist"
        exit    # quit the program
    end
end

try_load_students
interactive_menu



