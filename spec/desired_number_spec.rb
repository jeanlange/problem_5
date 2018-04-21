require 'desired_number'

describe DesiredNumber do
  context "using 1 digit: 1" do
    it "can find one answer expecting 1" do
      generator = DesiredNumber.new(1)
      answers = generator.find_combinations_for_the_answer(1)
      expect(answers.length).to eq 1
      expect(answers).to include("1")
    end
  end
end