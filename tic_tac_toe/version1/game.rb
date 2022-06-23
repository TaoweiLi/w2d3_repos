require_relative "board.rb"
require_relative "human_player.rb"

class Game

  def initialize(player_1_mark, player_2_mark)
    @player_1 = HumanPlayer.new(player_1_mark)
    @player_2 = HumanPlayer.new(player_2_mark)
    @board = Board.new
    @current_payler = @player_1
  end

  def switch_turn
    if @current_payler == @player_1
      @current_payler = @player_2
    else
      @current_payler = @player_1
    end
  end

  def play
    while @board.empty_positions?
      @board.print
      @board.place_mark(@current_payler.get_position, @current_payler.mark_value)
      if @board.win?(@current_payler.mark_value)
        puts "victory, #{@current_payler.mark_value} WIN!"
        return
      else
        self.switch_turn
      end
    end
    puts "DRAW"
  end
end


g1 = Game.new(:O, :X)

# p g1
# g1.switch_turn
# puts "-------------------------"
# p g1
# g1.switch_turn
# puts "-------------------------"
# p g1
# puts "-------------------------"
p g1.play



