class Rental
  attr_accessor :date
  attr_reader :person, :book

  def initialize(book, person, date)
    @date = date
    @book = book
    @person = person

    book.rentals << self
    person.rentals << self
  end

  # Methods triggered by user
  def self.add_rental(books, people, rentals)
    system "clear"
    puts 'What book is being rented?'
    book = UserInput.rental_book(books)
    person = UserInput.person_rental(people)
    date = DateTime.now()
    rentals.push(Rental.new(book, person, date))
    puts "Rental added successfully"
  end

  def self.list_all(rentals)
    system "clear"
    puts 'List of rentals:'
    rentals.each do |rental|
       puts "Book #{rental.book.title}, rented to #{rental.person.name} on #{rental.date.strftime("%d/%m/%Y")} at #{rental.date.strftime("%H:%M")}"
    end
  end

  def self.list_all_rentals_by_person_id(people)
    system "clear"
    puts 'Who is the person you want do check the rentals?'
    person = UserInput.person_rental(people)
    person.rentals.each do |rental|
       puts "#{rental.book.title} by #{rental.book.author} rented on: #{rental.date}"
    end
  end
end
