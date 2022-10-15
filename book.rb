require_relative './rental'

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person)
    Rental.new(self, person)
  end

  def list_all(books)
    system "clear"
    puts 'List of books:'
    books.each { |book| puts book.title}
    sleep 2
  end
end
