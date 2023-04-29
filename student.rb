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

s1 = Student.new(27, 'yemi', 'physics')
s2 = Student.new(20, 'mulye', 'maths')
puts s1.age
puts s1.name
puts s1.classroom

puts s2.age
puts s2.name
puts s2.classroom
classroom1 = Classroom.new('A1')
puts classroom1.add_student(s1)
puts classroom1.add_student(s2)

puts classroom1.students[1].classroom

book1 = Book.new('Did Aid', 'Dambisa mayo')
book2 = Book.new('the power of now', 'jey')

puts book1.author
puts book2.author

r1 = Rental.new('2023-04-28', book1, s1)
r2 = Rental.new('2023-04-28', book2, s1)
rental3 = Rental.new('2023-04-27', book1, s2)

puts r1.book.title
puts r1.person.name

puts r2.book.title
puts r2.person.name

puts rental3.book.title
puts rental3.person.name
