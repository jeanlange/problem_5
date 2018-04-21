class DesiredNumber
  def initialize
    @answers = []
  end

  def find_combinations_for_the_answer(desired_answer, remaining_string, string_so_far = "")
    if remaining_string.empty?
      puts string_so_far
      puts eval(string_so_far)
      if eval(string_so_far) == desired_answer
        @answers << string_so_far
      end
      return @answers
    end
    # 1 is desired answer. remaining_string is "1". string so far is ""
    # I want to recur with 0, "", "1"
    first_number = remaining_string.chars.first.to_i
    next_string = remaining_string.chars[1..-1].join
    find_combinations_for_the_answer(desired_answer, next_string, string_so_far << first_number.to_s)
  end
end