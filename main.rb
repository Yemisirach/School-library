require './app'

class Main
  attr_accessor :app, :books, :people

  def initialize
    @app = App.new
    @books = []
    @people = []
  end

  # displays the menu of options
  def display_menu
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def list_books
    @app.list_all_books(@books, show_list: true)
  end

  def list_people
    @app.list_all_people(@people, show_list: true)
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    select = gets.chomp.to_i

    puts 'Age:'
    age = gets.chomp.to_i

    puts 'Name:'
    name = gets.chomp

    if select == 2
      puts 'Specialization:'
      specialization = gets.chomp
    end

    if select == 1
      puts 'Has parent permission? [Y/N]:'
      parent_permission = gets.chomp.downcase == 'y'
    end

    person = @app.create_person(select, age, name, specialization, parent_permission)
    @people << person
    puts 'Person created successfully'
  end

  def create_book
    puts 'Title:'
    title = gets.chomp

    puts 'Author:'
    author = gets.chomp

    book = @app.create_book(title, author)
    @books << book
    puts 'Book created successfully'
  end

  def create_rental
    if @books.empty? || @people.empty?
      puts 'There are no books or people to create a rental'
      return
    end

    puts 'Select a book from the following list by number:'
    @app.list_all_books(@books, show_list: true)
    book = @books[gets.chomp.to_i - 1]

    puts 'Select a person from the following list by number:'
    @app.list_all_people(@people, show_list: true)
    person = @people[gets.chomp.to_i - 1]

    puts 'Date [YYYY-MM-DD]:'
    date = gets.chomp

    rental = @app.create_rental(book, person, date)
    if rental
      puts 'Rental created successfully'
    else
      puts 'Failed to create rental'
    end
  end
end
