class AuthorNameFormatter

  NICKNAMES = %w[FILHO FILHA NETO NETA SOBRINHO SOBRINHA JUNIOR].freeze
  ARTICLES = %w[da de do das dos].freeze

  attr_accessor :names, :size

  def initialize(full_name)
    @names = full_name.split(/\s/)
    @size = names.size
  end

  def formatted_name
    last_name + ', ' + first_name
  end

  private

  def first_name
    name = ''

    names.each_with_index do |word, index|
      word.downcase!
      word.capitalize! unless ARTICLES.include?(word)
      if index.zero?
        name = names.first
      elsif index < (size - 1) && !nickname_on_last_name?
        name = name + ' ' + word
      elsif index < (size - 2)
        name = name + ' ' + word
      end
    end
    name
  end

  def last_name
    if nickname_on_last_name?
      (names[size - 2] + ' ' + names.last).upcase
    else
      names.last.upcase
    end
  end


  def nickname_on_last_name?
    size > 2 && NICKNAMES.include?(names.last.upcase)
  end
end
