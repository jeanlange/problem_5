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

  context "using 2 digits" do
    it "can find one combo that adds up to 10 with the string 10 (digit combination)" do
      generator = DesiredNumber.new(10)
      answers = generator.find_combinations_from("10")
      expect(answers.length).to eq 1
      expect(answers).to include("10")
    end

    it "can find one combo that adds up to 2 with the string 11 (addition)" do
      generator = DesiredNumber.new(2)
      answers = generator.find_combinations_from("11")
      expect(answers.length).to eq 1
      expect(answers).to include("1+1")
    end

    it "can find one combo that adds up to 0 with the string 11 (subtraction)" do
      generator = DesiredNumber.new(2)
      answers = generator.find_combinations_from("11")
      expect(answers.length).to eq 1
      expect(answers).to include("1-1")
    end
  end
end