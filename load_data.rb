class LoadData
  def self.load_data(books, people, classrooms)
    ## populate @books
    books_dummy_data = [
      [ 'Book 1', 'Author1' ],
      [ 'Book 2', 'Author2' ],
      [ 'Book 3', 'Author3' ]
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
  end
end