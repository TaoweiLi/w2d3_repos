require_relative "board.rb"
require_relative "human_player.rb"
require_relative "computer_player.rb"

class Game
  def initialize(n, hash)
    @players = hash.map do |k, v|
      if v
        ComputerPlayer.new(k)
      else
        HumanPlayer.new(k)
      end
    end
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
      @board.place_mark(@current_player.get_position(@board.legal_positions), @current_player.mark_value)
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

g1 = Game.new(4, X: false, Y: true, Z: false)

# p g1
# g1.switch_turn
# puts "-------------------------"
# p g1
# g1.switch_turn
# puts "-------------------------"
# p g1
# puts "-------------------------"
p g1.play
