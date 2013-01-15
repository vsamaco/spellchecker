class SpellChecker
  attr_reader :dictionary

  def initialize(filename)
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
end