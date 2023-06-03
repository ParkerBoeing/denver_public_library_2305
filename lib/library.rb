class Library
  attr_reader :name, :books, :authors, :checked_out_books
  def initialize(name_of_lib)
    @name = name_of_lib
    @books = []
    @authors = []
    @checked_out_books = []
  end

  def add_author(author)
    @authors << author
    author.books.each do |book|
      @books << book
    end
  end

  def publication_time_frame(author)
    pub_time_frame = {
      start: "2500",
      finish: "0"
    }
    author.books.each do |book|
      if book.publication_year < pub_time_frame[:start]
        pub_time_frame[:start] = book.publication_year
      elsif book.publication_year > pub_time_frame[:finish]
        pub_time_frame[:finish] = book.publication_year
      else
      end
    end
    pub_time_frame
  end

  def checkout(book)
    if @books.include?(book) && @checked_out_books.include?(book) == false
      @checked_out_books << book
      p "You have successfully checked out this book."
      book.times_checked_out += 1
      true
    elsif @books.include?(book) && @checked_out_books.include?(book)
      p "Sorry, this book has already been checked out."
      false
    else
      p "Library does not currently contain this book."
      false
    end
  end

  def return(book)
    if @checked_out_books.include?(book)
      @checked_out_books.delete(book)
      true
    else
      p "Records indicate that this is not the library's book."
      false
    end
  end

  def inventory
  inventory = {}
  @authors.each do |author|
    inventory[author] = author.books
  end
  inventory
  end

  def most_popular_book
    most_checked_out = 0
    most_pop_book = nil
    @books.each do |book|
      if book.times_checked_out > most_checked_out
        most_pop_book = book
      else
      end
    end
    most_pop_book
  end
end