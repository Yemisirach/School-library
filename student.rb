require_relative 'person'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

class Student < Person
  attr_reader :classroom, :parent_permission, :name

  def initialize(age, name = 'Unknown', classroom = 'classZ', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\_(ツ)_/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
