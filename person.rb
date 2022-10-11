require 'securerandom'

class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = SecureRandom.uuid
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?(parent_permission)
    of_age || parent_permission ? true : false
  end

  private

  def of_age?(age)
    age >= 18
  end
end

person = Person.new(12, 'John', parent_permission: false)
puts person.name
