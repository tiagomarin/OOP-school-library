class Rental
  attr_accessor :date
  attr_reader :person, :book

  def initialize(book, person)
    @date = DateTime.now
    @book = book
    @person = person

    book.rentals << self
    person.rentals << self
  end
end
