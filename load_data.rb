require 'date'
class LoadData
  def self.load_data(books, people, classrooms, rentals)
    ## populate @books
    books_dummy_data = [
      ['The Grass is Always Greener', 'Jeffrey Archer'],
      ['Murder!', 'Arnold Bennett'],
      ['A Boy at Seven', 'John Bidwell'],
      ['The Open Boat', 'Stephen Crane'],
      ['The Higgler', 'A. E. Coppard']
    ]
    books_dummy_data.each do |book|
      books.push(Book.new(book[0], book[1]))
    end

    ## populate @people
    students_names = %w[John Ana Kevin]
    students_names.each do |name|
      people.push(Student.new(classroom: 'Alpha', age: 22, name: name, parent_permission: true))
    end
    teachers_names = %w[John Ana Kevin]
    teachers_names.each do |name|
      people.push(Teacher.new(age: 22, name: name, specialization: 'Ruby', parent_permission: true))
    end

    ## intanciate classrooms
    classrooms.each { |e| Classroom.new(e) }

    ## add dummy rentals
    date = DateTime.now
    people.each do |person|
      books.each do |book|
        rentals.push(Rental.new(book, person, date))
      end
    end
  end
end
