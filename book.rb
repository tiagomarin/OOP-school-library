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

  # Methods triggered by user
  def self.add_book(books)
    puts 'What is the title of the book?'
    title = gets.chomp.to_s
    puts 'Who is the Author'
    author = gets.chomp.to_s
    books.push(Book.new(title, author))
    puts 'Book created successfully!'
  end

  def self.list_all(books)
    system 'clear'
    puts 'List of books:'
    puts ''
    books.each do |book|
      puts "#{book.title} by #{book.author}"
    end
  end
end
