require './person'

class Teacher
  attr_accessor :specialization

  def initialize(age, name = 'Unknown', specialization = 'Unknown', parent_permission: true)
    super(name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
