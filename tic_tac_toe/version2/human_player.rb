class HumanPlayer
  def initialize(mark_value)
    @mark_value = mark_value
  end

  def mark_value
    @mark_value
  end

  def get_position
    arr = []
    puts "Player #{@mark_value}, enter a position with coordinates separated with a space like `4 7`"
    input = gets.chomp.split(" ")

    if input.length != 2 || input.any? { |ele| ele.to_i.to_s != ele }
      raise ArgumentError.new "wrong input format!"
    end

    arr.push(input[0].to_i, input[1].to_i)
    return arr
  end
end

# h1 = HumanPlayer.new (:X)
# p h1.get_position
