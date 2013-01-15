class SpellChecker
  attr_reader :dictionary

  def initialize(filename="file.txt")
    create_dictionary(filename)
  end
  
  def create_dictionary(file_name)
    @dictionary = Hash.new(0)

    # words = File.open(file_name, "r") { |f| f.read }.split
    
    file = File.open(file_name, "r")
    
    words = words(file.read())
    words.each do |word|
      @dictionary[word.downcase] += 1
    end
  end
  
  def words(text)
    text.downcase.scan(/[a-z]+/)
  end
  
  def known(words)
    known_words = Set.new
    words.each do |word|
      known_words << word if @dictionary.include?(word)
    end
    
    known_words
  end
  
  def correct(word)
    suggestions = Set.new
    suggestions = known([word])
    suggestions = known(edit_by_one(word)) if suggestions.empty?
    
    suggestions.max{ |a, b| @dictionary[a] <=> @dictionary[b] }
  end
  
  def edit_by_one(word)
    deletes = Array.new
    
    Set.new(deletes)
  end
end