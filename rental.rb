class Rental
  def initialize(book, person)
    @date = DateTime.now
    @book = book
    @person = person

    book.rentals << self
    person.rentals << self
  end

  attr_accessor :date
  attr_reader :person, :book
end
