class Book
  attr_reader :title, :author, :publication_year
  def initialize(book)
    @title = book[:title]
    @author = "#{book[:author_first_name]} #{book[:author_last_name]}"
    @publication_year = book[:publication_date].split[-1]
    @times_checked_out = 0
  end

  def times_checked_out
    @times_checked_out
  end

  def times_checked_out=(value)
    @times_checked_out = value
  end
end 