class AuthorNameFormatter

  NICKNAMES = %w[FILHO FILHA NETO NETA SOBRINHO SOBRINHA JUNIOR].freeze
  ARTICLES = %w[da de do das dos].freeze

  attr_accessor :full_name

  def initialize(full_name)
    @full_name = full_name
  end

  def formatted_name
    adjust_articles.last.upcase + ', ' + adjust_articles.first
  end

  private

  def adjust_articles
    names_to_array = full_name.split(/\s/) # split in array of words
    size = names_to_array.size

    if size > 2 && NICKNAMES.include?(names_to_array.last.upcase)
      names_to_array[size -1] = names_to_array[size - 2] + " " + names_to_array.last
      names_to_array.delete(size - 2)
    end

    names_to_array.each do |word|
      word.downcase!
      word.capitalize! unless ARTICLES.include?(word)
    end

    names_to_array.each_with_index do |word, index|
      if ARTICLES.include?(word.downcase) && index.positive?
        names_to_array[index - 1] = names_to_array[index - 1] + " " + word
        names_to_array.delete(index)
      end
    end
  end
end
