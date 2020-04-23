require 'csv'

class List

  attr_accessor :names

  def initialize(name_list)
    @name_list = name_list
  end

  def sorted_names
    @sorted_names ||= @name_list.sort # sorting can also be implemented manually
  end

  def names_list
    names = []
    sorted_names.each_with_index do |name, index|
      names << Name.new(name, index + 1)
    end
    names
  end

  def total_name_score
    names_list.sum(&:score)
  end
end

class Name

  attr_accessor :text, :position

  def initialize(text, position)
    @text = text
    @position = position
  end

  def value
    value = 0
    @text.each_char do |letter|
      value += letter.ord - 64
    end
    value
  end

  def score
    @position * value
  end

end
