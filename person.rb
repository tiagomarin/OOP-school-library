require 'securerandom'
require_relative './nameable'
require './capitalize_decorator'
require './trimmer_decorator'
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = SecureRandom.uuid
    @name = name
    @age = age
    @parent_permission = !parent_permission.nil?
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age || @parent_permission
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
