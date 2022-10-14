require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './classroom'
require_relative './rental'
require_relative './book'

student1 = Student.new(age: 22, name: 'Maximilianus', classroom: 'ruby', parent_permission: true)
pp student1
pp Classroom

teacher1 = Teacher.new(name: 'John', age: 54, specialization: 'ruby')
pp teacher1

book1 = Book.new(title: 'Ruby best tricks', author: 'Tiago')
book2 = Book.new(title: 'CSS tricks', author: 'Tiago')
pp book1

rental1 = Rental.new(person: student1, book: book1, date: '12, nov, 2019')
puts '------------------------------------'
puts 'rental 1 details'
pp "person: #{rental1.person.name}"
pp "title: #{rental1.book.title}"
pp "author: #{rental1.book.author}"
pp "date: #{rental1.date}"

Rental.new(person: student1, book: book2, date: '20, jan, 2020')
puts '------------------------------------'
puts 'student 1 rentals:'
student1.rentals.each { |rental| puts rental.book.title }
puts '------------------------------------'

book1.add_rental(teacher1, '02, dez, 2018')
book1.add_rental(student1, '05, jan, 2019')
puts 'book 1 rentals:'
book1.rentals.each { |rental| pp "Rental date: #{rental.date} | #{rental.person.name}" }
puts '------------------------------------'

teacher1.add_rental(book2, '22, jun, 2020')
pp teacher1.name
puts 'teacher rentals:'
teacher1.rentals.each { |rental| pp "Rental date: #{rental.date} | #{rental.book.title}" }
puts '------------------------------------'
