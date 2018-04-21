class DesiredNumber
  def initialize(desired)
    @desired = desired
    @answers = []
  end

  def find_combinations_from(remaining_string, string_so_far = "")
    if remaining_string.empty?
      if eval(string_so_far) == @desired
        @answers << string_so_far
      end
    else
      first_number = remaining_string.chars.first.to_i
      next_string = remaining_string.chars[1..-1].join
      joined = string_so_far + "#{first_number}"
      added = string_so_far + "+#{first_number}"
      subtracted = string_so_far + "-#{first_number}"
      find_combinations_from(next_string, joined)
      if !string_so_far.empty?
        find_combinations_from(next_string, added)
        find_combinations_from(next_string, subtracted)
      end
    end
    return @answers
  end
end