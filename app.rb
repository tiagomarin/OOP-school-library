require_relative

class App
  def start
    # add necessary dummy data
    classrooms = ["Alpha", "Beta", "Charlie"]
    classrooms.each{ |e| Classroom.new(e)}
    
    books = ["Book 1", "Book 2", "Book 3"]
    books.each{ |e| Book.new(e)}
    
    students = ["John", "Ana", "Kevin"]
    students.each do |student| 
      Student.new("Alpha", 22, e, parent_permission: true)
    end

    teachers = ["John", "Ana", "Kevin"]
    teachers.each do |teacher| 
      Teacher.new(22, e, "Ruby")
    end

    # start
    puts "Welcome to the School Library"
    promt_start_input
  end
  def promt_start_input
    options = [
      '',
      '     [1] Add a person',
      '     [2] Add a book',
      '     [3] Add a rental',
      '     [4] List all people',
      '     [5] List all books',
      '     [6] List all rentals',
      '     [7] List all rentals for a given person id',
      '     [8] List all students',
      '     [9] List all teachers',
      '     [10] Exit',
      ''
    ]
    puts '-------------------------------------------------'
    puts "What do you wanna do?"
    puts "\nEnter a number from the options below:"
    puts options
    choice = gets.chomp.to_i
    puts "\nyour option: #{choice}"

    case choice
      when 1
        add_person
        promt_start_input
      when 2
        add_book
        promt_start_input
      when 3
        add_rental
        promt_start_input
      when 4
        list_all_people
        promt_start_input
      when 5
        list_all_books
        promt_start_input
      when 6
        list_all_rentals
        promt_start_input
      when 7
        list_all_rentals_by_person_id
        promt_start_input
      when 8
        list_all_students
        promt_start_input
      when 9
        list_all_teachers
        promt_start_input
      when 10
        puts "Exited the program."
        puts "\dSee you next time!"
      else
        puts "Error!"
        puts "Make sure you are typing exactly a number"
        promt_start_input
    end
  end

  def add_person
    puts 'To add a student, please enter 1'
    puts 'To add a teacher, please enter 2'
    user_input = gets.chomp.to_i
    case user_input
    when 1
      puts "What is the name of your student?"
      name = gets.chomp.to_s
      puts "What is the age of the student?"
      age = gets.chomp.to_i
      puts "What is his classroom?"
      # show classroom options
      def get_classroom
        classrooms.each_with_index do |class, index| 
          puts "Class '#{class}' enter - #{index+1}"
        end
        user_answer = gets.chomp.to_i
        
        if user_answer > classrooms.length + 1 || user_answer == 0
          puts "Error! To add a student you must provide a valid Classroom. Please select one number from the list."
          get_classroom
        end
      end
      classroom = classrooms[user_answer-1]

      Student.new(classroom, name, age)
      puts "Student successfully added."
    when 2


    end
  end

  def add_book

  end

  def add_rental

  end

  def list_all_people

  end

  def list_all_books

  end

  def list_all_rentals_by_person_id

  end

  def list_all_students

  end

  def list_all_teachers

  end
  
  start
end
