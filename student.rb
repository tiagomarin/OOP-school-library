require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom:, age:, name:, parent_permission:)
    super(age: age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  # Methods triggered by user
  def self.list_all(people)
    system 'clear'
    puts 'List of all students'
    puts ''
    people.each do |person|
      puts person.name if person.is_a?(Student)
    end
  end
end
