require_relative './app'
require_relative './person'

def classroom(classrooms)
  classrooms.each_with_index do |e, index|
    puts "Class '#{e}' enter - #{index + 1}"
  end
  answer = gets.chomp.to_i

  if answer > classrooms.length || answer <= 0
    puts 'Error! To add a student you must provide a valid Classroom. Please select one number from the list.'
    sleep 0.75
    classroom(classrooms)
  else
    answer - 1
  end
end
class UserInput
  # helper methods to add a person
  

  def self.parent_permission
    puts 'Does the student have parent permission?'
    puts 'Yes - 1'
    puts 'No  - 2'
    answer = gets.chomp.to_i
    case answer
    when 1 then true
    when 2 then false
    else
      puts 'Error! To add a student you must provide a valid parent permission. Please select one number from the list.'
      sleep 0.75
      parent_permission
    end
  end

  def self.specialization(specializations)
    specializations.each_with_index do |specialization, index|
      puts "#{specialization} enter - #{index + 1}"
    end
    answer = gets.chomp.to_i

    if answer > specializations.length || answer <= 0
      puts 'Error! To add a teacher you MUST provide a valid Specialization. Please select one number from the list.'
      sleep 0.75
      specialization(specializations)
    end
    answer
  end

  # -----------------------------
  # helper methods to add a rental
  def self.rental_book(books)
    books.each_with_index do |e, index|
      puts "[#{index + 1}] - #{e.title} - by - #{e.author}"
    end
    answer = gets.chomp.to_i

    if answer > books.length || answer <= 0
      puts 'Error! To add a rental you must select a book that it is in the inventory. Please select one number from the list.'
      sleep 0.85
      rental_book(books)
    end
    books[answer - 1]
  end

  def self.person_rental(people)
    puts 'This is the list of available people:'
    people.each_with_index do |e, index|
      puts "[#{index + 1}] - #{e.name}"
    end
    puts 'Select a number:'
    answer = gets.chomp.to_i
    if answer > people.length || answer <= 0
      puts 'Error! You must select a valid person. Please select one NUMBER from the list.'
      person_rental(people)
    else
      people[answer - 1]
    end
  end
end
