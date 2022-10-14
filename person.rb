require 'securerandom'
require_relative './nameable'
require_relative './capitalize_decorator'
require_relative './trimmer_decorator'
require_relative './rental'
class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age:, name: 'Unknown', parent_permission: true)
    super()
    @id = SecureRandom.uuid
    @rentals = []
    @name = name
    @age = age
    @parent_permission = !parent_permission.nil?
  end

  def add_rental(book, date)
    Rental.new(book: book, person: self, date: date)
  end

  def can_use_services?
    of_age || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?(age)
    age >= 18
  end
end
