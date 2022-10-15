require_relative './classroom'
require_relative './book'
require_relative './student'
require_relative './teacher'
require_relative './rental'
require_relative './user_input'
require_relative './load_data'
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
    LoadData.load_data(@books, @people, @classrooms)
    # start
    puts 'Welcome to the School Library'
    sleep 1.25
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
    puts 'What do you wanna do?'
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
      Person.list_all_people(@people)
      promt_start_input
    when 5
      Book.list_all(@books)
      promt_start_input
    when 6
      Rental.list_all(@rentals)
      promt_start_input
    when 7
      list_all_rentals_by_person_id
      promt_start_input
    when 8
      Student.list_all(@people)
      promt_start_input
    when 9
      Teacher.list_all(@people)
      promt_start_input
    when 10
      puts 'Exited the program.'
      puts 'See you next time!'
    else
      puts 'Error!'
      puts 'Make sure you are typing exactly a number'
      sleep 0.75
      promt_start_input
    end
  end

  def add_person
    system 'clear'
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
      puts 'Error! To add a person you MUST choose between a student or teacher. Please select one number from the list.'
      sleep 0.75
      add_person
    end
  end

  def add_book
    system "clear"
    puts 'What is the title of the book?'
    title = gets.chomp.to_s
    puts 'Who is the Author'
    author = gets.chomp.to_s
    @books.push(Book.new(title, author))
    puts "Book created successfully!"
  end




  def add_rental
    system "clear"
    puts 'What book is being rented?'
    book = UserInput.rental_book(@books)
    person = UserInput.person_rental(@people)
    date = Date.now
    @rentals.push(Rental.new(book, person, date))
  end

  

  def list_all_rentals_by_person_id
    system "clear"
    puts 'Who is the person you want do check the rentals?'
    answer = gets.chomp.to_s

    if people.include?[name:answer]
      person = people[name:answer]
    else
      puts "Person not found. Try again!"
    end

    person.rentals.each do |rental|
       puts "#{rental.book.title} by #{rental.book.author} rented on: #{rental.date}"
    end
  end

  
  
end
