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
      generator = DesiredNumber.new(0)
      answers = generator.find_combinations_from("11")
      expect(answers.length).to eq 1
      expect(answers).to include("1-1")
    end
  end

  context "using 3 digits" do
    # 123 => 123, 1+23, 1-23, 1+2+3, 1+2-3, 1-2+3, 1-2-3, 12+3, 12-3
    #        123, 24,   -22,  6,     0,     2,     -4,    15,   9
    it "can find one combo that adds up to 123 with the string 123 (123)" do
      generator = DesiredNumber.new(123)
      answers = generator.find_combinations_from("123")
      expect(answers.length).to eq 1
      expect(answers).to include("123")
    end

    it "can find one combo that adds up to -22 with the string 123 (1-23)" do
      generator = DesiredNumber.new(-22)
      answers = generator.find_combinations_from("123")
      expect(answers.length).to eq 1
      expect(answers).to include("1-23")
    end

    it "can find one combo that adds up to 0 with the string 123 (1+2-3)" do
      generator = DesiredNumber.new(0)
      answers = generator.find_combinations_from("123")
      expect(answers.length).to eq 1
      expect(answers).to include("1+2-3")
    end

    # 111 => 111, 1+11, 1-11, 1+1+1, 1+1-1, 1-1+1, 1-1-1, 11+1, 11-1
    #        111, 12,   -10,  3,     1,     1,     -1,    12,   10
    it "can find 2 combos that add up to 1 with the string 111 (1+1-1, 1-1+1)" do
      generator = DesiredNumber.new(1)
      answers = generator.find_combinations_from("111")
      expect(answers.length).to eq 2
      expect(answers).to include("1+1-1")
      expect(answers).to include("1-1+1")
    end
  end
end

generator = DesiredNumber.new(100)
answers = generator.find_combinations_from("123456789")
puts "There are #{answers.length} answers. They are:"
puts answers