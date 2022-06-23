class Board
  def initialize(n)
    @grid = Array.new(n) { Array.new(n) { :N } }
    @size = n * n
  end

  def size
    @size
  end

  def [](pos) # postion == [row, column]
    row = pos[0]
    col = pos[1]
   return @grid[row][col]
  end

  def []=(pos, value)
    row = pos[0]
    col = pos[1]
   return @grid[row][col] = value
  end

  def num_ships
    return @grid.flatten.count(:S)
  end

  # PART 2
  def attack(pos)
    if self[pos] == :S
      self[pos] = :H
      puts "you sunk my battleship!"
      return true
    else
      self[pos] = :X
      return false
    end
  end

  def place_random_ships
    while self.num_ships < @size * 0.25
      row = rand(0...@grid.length)
      col = rand(0...@grid.length)
      @grid[row][col] = :S
    end
  end

  def hidden_ships_grid
    new_arr = Array.new(@grid.length) { Array.new(@grid.length) }

    (0...@grid.length).each do |i|
      (0...@grid.length).each do |j|
        ele = @grid[i][j]
        if ele == :S
          ele = :N
        end
        
        new_arr[i][j] = ele
      end
    end

    return new_arr
  end

  def self.print_grid(grid)
    grid.each do |sub_arr|
      puts sub_arr.join(" ")
    end
  end

  def cheat
    return Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end
end

b1 = Board.new(10)
b1[[1,2]]



