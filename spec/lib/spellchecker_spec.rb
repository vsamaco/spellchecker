require 'spec_helper'

describe SpellChecker do
  describe "#initialize" do
    let(:spellchecker) { SpellChecker.new("file.txt") }
    let(:data) { "The quick brown fox foo foo foo." }
    let(:result) { {"the" => 1, "quick" => 1, "brown" => 1, "fox" => 1, "foo" => 3} }

    it "should read file and create frequency dictionary" do
      File.stub(:open).with("file.txt", "r") { StringIO.new(data) }
      spellchecker.dictionary.should == result
    end
  end
end