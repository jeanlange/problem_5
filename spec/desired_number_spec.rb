require 'desired_number'

describe DesiredNumber do
  context "using 1 digit" do
    it "can find one combo that adds up to 1 with the string 1" do
      generator = DesiredNumber.new(1)
      answers = generator.find_combinations_from("1")
      expect(answers.length).to eq 1
      expect(answers).to include("1")
    end

    it "can find one combo that adds up to 2 with the string 2" do
      generator = DesiredNumber.new(2)
      answers = generator.find_combinations_from("2")
      expect(answers.length).to eq 1
      expect(answers).to include("2")
    end

    it "finds no combos that add up to 2 with the string 1" do
      generator = DesiredNumber.new(2)
      answers = generator.find_combinations_from("1")
      expect(answers.length).to eq 0
    end
  end
end