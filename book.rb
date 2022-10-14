require_relative './rental'

class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  attr_accessor :title, :author
  attr_reader :rentals

  def add_rental(person)
    Rental.new(self, person)
  end
end
