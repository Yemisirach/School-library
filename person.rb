require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..100)
    @name = name,
            @age = age,
            @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(date, book)
    rental = Rental.new(date, book, self)
    rentals << rental
    rental
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
