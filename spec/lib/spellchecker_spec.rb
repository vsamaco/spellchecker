require 'spec_helper'

describe SpellChecker do
  describe "#initialize" do
    let(:spellchecker) { SpellChecker.new }
    let(:data) { "The quick brown fox foo foo foo." }
    let(:result) { {"the" => 1, "quick" => 1, "brown" => 1, "fox" => 1, "foo" => 3} }

    it "should read file and create frequency dictionary" do
      File.stub(:open).with("file.txt", "r") { StringIO.new(data) }
      spellchecker.dictionary.should == result
    end
  end
  
  describe "#correct" do
    let(:spellchecker) { SpellChecker.new }
    let(:data) { "one two three four five" }
    
    before(:each) do
      File.stub(:open).with("file.txt", "r") { StringIO.new(data) }
    end
    
    it "should return same word for correct spelling" do
      words = ["one", "two", "three"]
      words.each do |word|
        spellchecker.correct(word).should == word.downcase
      end
    end
    
    it "should return no suggestions for wrong spelling" do
      words = ["ten", "twenty", "thirty"]
      words.each do |word|
        spellchecker.correct(word).should == nil
      end
    end
  end
end