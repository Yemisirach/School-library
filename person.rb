require_relative 'nameable'
require_relative 'base_decorator'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals, :parent_permission

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  def correct_name
    @name
  end

  def can_use_services?
    if isof_age? || @parent_permission
      true
    else
      false
    end
  end

  private

  def isof_age?
    @age >= 18
  end
end
