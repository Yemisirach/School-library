require_relative 'person'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

class Student < Person
  attr_accessor :classroom, :parent_permission, :name

  def initialize(classroom, age, name: 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '"¯\(ツ)/¯"'
  end

  # setter
  def update_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
