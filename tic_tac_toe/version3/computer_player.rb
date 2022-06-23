class ComputerPlayer
  def initialize(mark_value)
    @mark_value = mark_value
  end

  def mark_value
    @mark_value
  end

  def get_position(legal_positions)
    arr = legal_positions[rand(legal_positions.length)]
    puts "Computer Player #{@mark_value}, put in position #{arr}."
    return arr
  end
end
