require_relative './classroom'
require_relative './book'
require_relative './student'
require_relative './teacher'
require_relative './rental'

class App
  def start
    # add necessary dummy data
    @classrooms = %w[Alpha Beta Charlie]
    @classrooms.each { |e| Classroom.new(e) }

    @specializations = %w[Ruby CSS JavaScript React]

    books = []
    books_dummy_data = [{ title: 'Book 1', author: 'Author1' }, { title: 'Book 2', author: 'Author2' },
                        { book: 'Book 3', author: 'Author3' }]
    books_dummy_data.each do |e|
      e.map { |key, value| books.push(Book.new(key, value)) }
    end

    students = []
    students_names = %w[John Ana Kevin]
    students_names.each do |name|
      students.push(Student.new(classroom: 'Alpha', age: 22, name: name, parent_permission: true))
    end

    teachers = []
    teachers_names = %w[John Ana Kevin]
    teachers_names.each do |name|
      teachers.push(Teacher.new(age: 22, name: name, specialization: 'Ruby', parent_permission: true))
    end

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
      puts 'What is the name of the student?'
      name = gets.chomp.to_s
      puts 'What is the age of the student?'
      age = gets.chomp.to_i
      puts 'What is his classroom?'
      # show classroom options
      def get_classroom
        @classrooms.each_with_index do |e, index|
          puts "Class '#{e}' enter - #{index + 1}"
        end
        @@user_answer = gets.chomp.to_i

        if @@user_answer > @classrooms.length + 1 || @@user_answer == 0
          puts 'Error! To add a student you must provide a valid Classroom. Please select one number from the list.'
          sleep 0.75
          get_classroom
        end
      end
      get_classroom
      classroom = @classrooms[@@user_answer - 1]
      def get_parent_permission
        puts 'Does the student have parent permission?'
        puts 'Yes - 1'
        puts 'No  - 2'
        answer = gets.chomp.to_i
        case answer
        when 1
          @parent_permission = true
        when 2
          @parent_permission = false
        else
          puts 'Error! To add a student you must provide a valid parent permission. Please select one number from the list.'
          sleep 0.75
          get_parent_permission
        end
      end
      get_parent_permission
      Student.new(classroom: classroom, name: name, age: age, parent_permission: @parent_permission)
      puts 'Student successfully added.'
    when 2 # add a teacher ------------------
      puts 'What is the name of the teacher?'
      name = gets.chomp.to_s
      puts 'What is the age of the teacher?'
      age = gets.chomp.to_i
      puts 'What is his specialization?'
      # show specialization options
      def get_specialization
        @specializations.each_with_index do |specialization, index|
          puts "#{specialization} enter - #{index + 1}"
        end
        @user_answer = gets.chomp.to_i

        if @user_answer > @specializations.length + 1 || @user_answer <= 0
          puts 'Error! To add a teacher you MUST provide a valid Specialization. Please select one number from the list.'
          sleep 0.75
          get_specialization
        end
      end
      get_specialization
      specialization = @specializations[@user_answer - 1]

      Teacher.new(specialization: specialization, name: name, age: age)
      puts 'Teacher successfully added.'
    else
      puts 'Error! To add a person you MUST choose between a student or teacher. Please select one number from the list.'
      sleep 0.75
      add_person
    end
  end

  def add_book
    puts 'What is the title of the book?'
    title = gets.chomp.to_s
    puts 'To add a teacher, please enter 2'
  end

  def add_rental; end

  def list_all_people; end

  def list_all_books; end

  def list_all_rentals_by_person_id; end

  def list_all_students; end

  def list_all_teachers; end
end
