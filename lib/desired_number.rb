class DesiredNumber
  def initialize(desired)
    @desired = desired
    @answers = []
  end

  def find_combinations_from(remaining_string, string_so_far = "")
    # puts "in find combos. remaining: #{remaining_string}. string_so_far: #{string_so_far}"
    if remaining_string.empty?
      # puts "remaining string is empty"
      if eval(string_so_far) == @desired
        # puts "and it evaluates to the answer!"
        @answers << string_so_far
        # puts "answers: #{@answers}"
      end
    else
      # 1 is desired answer. remaining_string is "1". string so far is ""
      # I want to recur with "", "1"
      # 2 is desired answer. remaining_string is "1". string so far is ""
      # I want to recur with 0, "", "1"

      first_number = remaining_string.chars.first.to_i
      next_string = remaining_string.chars[1..-1].join
      joined = string_so_far + "#{first_number}"
      added = string_so_far + "+#{first_number}"
      subtracted = string_so_far + "-#{first_number}"
      # puts "recurring!"
      find_combinations_from(next_string, joined)
      if !string_so_far.empty?
        # puts "answer_so_far isn't empty"
        find_combinations_from(next_string, added)
        find_combinations_from(next_string, subtracted)
      end
    end
    return @answers
  end
end