require_relative 'person'

class Student < Person
  def initialize(classroom, age, name: 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '"¯\(ツ)/¯"'
  end
end

person = Student.new(14, 'persone_one' , false)
puts person.can_use_services?

