require_relative "board.rb"
require_relative "human_player.rb"

class Game
  def initialize(n, *marks)
    @players = marks.map { |mark| HumanPlayer.new(mark) }
    @board = Board.new(n)
    @current_player = @players[0]
  end

  def switch_turn
    @players.rotate!
    # p "[DEBUG] #{@players}"
    @current_player = @players[0]
    # p "[DEBUG] #{@players[0]}"
    # p "[DEBUG] #{@current_player}"
  end

  def play
    while @board.empty_positions?
      @board.print
      @board.place_mark(@current_player.get_position, @current_player.mark_value)
      if @board.win?(@current_player.mark_value)
        puts "victory, #{@current_player.mark_value} WIN!"
        return
      else
        self.switch_turn
      end
    end
    puts "DRAW"
  end
end

g1 = Game.new(10, :O, :X, "A")

# p g1
# g1.switch_turn
# puts "-------------------------"
# p g1
# g1.switch_turn
# puts "-------------------------"
# p g1
# puts "-------------------------"
p g1.play
