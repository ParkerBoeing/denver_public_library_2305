class Author
  attr_reader :name, :books
  def initialize(author)
    @name = "#{author[:first_name]} #{author[:last_name]}"
    @books = []
    @first_name = author[:first_name]
    @last_name = author[:last_name]
  end

  def write(name_of_book, date)
    organized_hash = {
      author_first_name: @first_name,
      author_last_name: @last_name,
      title: name_of_book,
      publication_date: date
    }
     new_book = Book.new(organized_hash)
     @books << new_book
     new_book
  end
end