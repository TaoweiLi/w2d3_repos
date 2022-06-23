class HumanPlayer
  def initialize(mark_value)
    @mark_value = mark_value
  end

  def mark_value
    @mark_value
  end

  def get_position(legal_positions)
    begin
      arr = []
      puts "Player #{@mark_value}, enter a position with coordinates separated with a space like `4 7`"
      input = gets.chomp.split(" ")
      arr.push(input[0].to_i, input[1].to_i)

      if input.length != 2 || input.any? { |ele| ele.to_i.to_s != ele } || !legal_positions.include?(arr)
        raise ArgumentError.new "wrong input format!"
      end

      return arr
    rescue
      puts "wrong input, please try again!"
      retry
    end
  end
end

# h1 = HumanPlayer.new (:X)
# p h1.get_position
