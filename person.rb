require 'securerandom'
require_relative './nameable'
require_relative './capitalize_decorator'
require_relative './trimmer_decorator'
require_relative './rental'
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = SecureRandom.uuid
    @rentals = []
    @name = name
    @age = age
    @parent_permission = !parent_permission.nil?
  end

  def add_rental(book)
    Rental.new(book, self)
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

person = Person.new(22, 'maximilianus')
pp person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
pp capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
pp capitalized_trimmed_person.correct_name
