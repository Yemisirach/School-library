require_relative 'person'

require_relative 'base_decorator'

require_relative 'capitalize_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.length > 10 ? @nameable.correct_name[0..9] : @nameable.correct_name
  end
end

person = Person.new(27, 'yemi')
puts person.correct_name
capitalized = CapitalizeDecorator.new(person)
puts capitalized.correct_name
capitalized_trimmed = TrimmerDecorator.new(person)
puts capitalized_trimmed.correct_name