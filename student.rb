require './person'

class Student
  attr_accessor :classroom

  def initialize(age, name = 'Unknown', classroom = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
