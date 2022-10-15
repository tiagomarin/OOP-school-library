require_relative './classroom'
require_relative './book'
require_relative './student'
require_relative './teacher'
require_relative './rental'
require_relative './user_input'
require_relative './load_data'
require 'date'
# require_relative './'
# require_relative './'

class App
  def start
    # add instance variables
    @books = []
    @rentals = []
    @people = []
    @classrooms = %w[Alpha Beta Charlie]
    @specializations = %w[Ruby CSS JavaScript React]
    # add dummy data
    LoadData.load_data(@books, @people, @classrooms, @rentals)
    # start
    puts ''
    puts 'Welcome to the School Library'
    sleep 1.1
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
    puts ''
    puts '-------------------------------------------------'
    puts ''
    puts 'What do you wanna do?'
    puts "\nEnter a number from the options below:"
    puts options
    choice = gets.chomp.to_i
    puts "\nyour option: #{choice}"

    case choice
    when 1
      system 'clear'
      add_person
      promt_start_input
    when 2
      system 'clear'
      Book.add_book(@books)
      promt_start_input
    when 3
      system 'clear'
      Rental.add_rental(@books, @people, @rentals)
      promt_start_input
    when 4
      system 'clear'
      Person.list_all_people(@people)
      promt_start_input
    when 5
      system 'clear'
      Book.list_all(@books)
      promt_start_input
    when 6
      system 'clear'
      Rental.list_all(@rentals)
      promt_start_input
    when 7
      system 'clear'
      Rental.list_all_rentals_by_person_id(@people)
      promt_start_input
    when 8
      system 'clear'
      Student.list_all(@people)
      promt_start_input
    when 9
      system 'clear'
      Teacher.list_all(@people)
      promt_start_input
    when 10
      system 'clear'
      puts 'Exited the program.'
      puts ''
      puts 'See you next time!'
      sleep 2
    else
      system 'clear'
      puts 'Error!'
      puts 'Make sure you are typing exactly a NUMBER from the list'
      sleep 0.75
      promt_start_input
    end
  end

  def add_person
    puts 'To add a student, please enter 1'
    puts 'To add a teacher, please enter 2'
    user_input = gets.chomp.to_i
    case user_input    
    when 1 # add a student ------------------
      system "clear"
      puts 'What is the name of the student?'
      name = gets.chomp.to_s
      puts 'What is the age of the student?'
      age = gets.chomp.to_i
      puts 'What is his classroom?'
      # show classroom options    
      classroom = UserInput.classroom(@classrooms)
      # call method to find out parent permission
      parent_permission = UserInput.parent_permission
      
      Student.new(classroom: classroom, name: name, age: age, parent_permission: parent_permission)
      system "clear"
      puts 'Student successfully added.'
    when 2 # add a teacher ------------------
      system "clear"
      puts 'What is the name of the teacher?'
      name = gets.chomp.to_s
      puts 'What is the age of the teacher?'
      age = gets.chomp.to_i
      puts 'What is his specialization?'
      specialization = UserInput.specialization(@specializations)

      Teacher.new(specialization: specialization, name: name, age: age)
      puts 'Teacher successfully added.'
    else
      system "clear"
      puts 'Error! To add a person you MUST choose between a student or teacher. Please select one number from the list.'
      sleep 1.5
      add_person
    end
  end
end
