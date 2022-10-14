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
pp rental1.person.name

Rental.new(person: student1, book: book2, date: '20, jan, 2020')
student1.rentals.each { |rental| puts rental.book.title }
