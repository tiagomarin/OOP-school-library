require_relative './person'
class Teacher < Person
  attr_accessor :specialization

  def initialize(age:, name:, specialization: 'Unknown', parent_permission: true)
    super(age: age, name: name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  # Methods triggered by user
  def self.list_all(people)
    system "clear"
    puts "List of all teachers"
    people.each do |person|
    puts person.name if person.is_a?(Teacher)
    end
  end
end
