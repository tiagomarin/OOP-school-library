require_relative './person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, name, parent_permission)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

student = Student.new('ruby class', 14, 'tiago')
puts student.name
puts student.parent_permission
