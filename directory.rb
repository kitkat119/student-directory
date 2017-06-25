@students = [] # an empty array accessible to all methods

def print_menu
    puts "Please enter a number according to the action you wish to take:"
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from a file"
    puts "9. Exit."
end

def interactive_menu
    loop do
        print_menu
        process(STDIN.gets.chomp)
    end
end

def process(selection) 
    possible_inputs = ["1", "2", "3", "4", "9"]
    puts "Command successful!!!" if possible_inputs.include?(selection)
    case selection
        when "1" then input_students
        when "2" then show_students
        when "3" then save_students
        when "4" then load_students()
        when "9" then exit
    else puts "I don't know what you mean, try again"
    end

end

def input_students
    puts "Please enter the first and second name of the student"
    name = STDIN.gets.chomp
    months = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]

        while !name.empty? do
            puts "Thank you. Which cohort are they in?"
            cohort = STDIN.gets.chomp.capitalize.to_sym
                
                if cohort.empty?
                    cohort = "July".to_sym 
                    puts "The cohort has reverted to the default of July." 
                end
                until months.include?(cohort)
                    puts "Please enter a valid month of the year"
                    cohort = STDIN.gets.chomp.capitalize.to_sym
                end
        
            puts "Which country were they born in?"
            country = STDIN.gets.chomp
            puts "How tall are they in cm?"
            height = STDIN.gets.chomp
            puts "What is their favourite hobby?"
            hobby = STDIN.gets.chomp
   
        #add student hash to the array
            add_to_students_array(name, cohort, country, height, hobby)
            puts "Now we have #{@students.count} student" if @students.count == 1 
            puts "Now we have #{@students.count} students" if @students.count > 1 
                
            puts "Please add another student. If there are no more to add, hit return"
            #get another name from the user
            name = STDIN.gets.chomp
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
    puts "Overall, we have #{@students.count} great student"  if @students.count == 1 
    puts "Overall, we have #{@students.count} great students"
end

def save_students
    puts "Which file would you like to save to? (You can always save to students.csv if needed!)"
    filename = gets.chomp
    file = File.open(filename, "w")
    @students.each do |student|
        csv_line = [student[:name], student[:cohort], student[:country], student[:height], student[:hobby]].join(",")
        file.puts csv_line
    end
    file.close
    puts "The students have been successfully saved to the #{filename} file"
end

def load_students(filename = "students.csv")
    puts "If you'd like to load the list of students from a file other than students.csv, please enter it now. Otherwise, just hit return to continue to load from students.csv."
    other_filename = STDIN.gets.chomp
    filename ||= other_filename if File.exists?(other_filename)
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
          
    end
end

try_load_students
interactive_menu



