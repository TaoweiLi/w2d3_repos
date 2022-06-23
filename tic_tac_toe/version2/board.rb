class Board
  def initialize(n)
    @grid = Array.new(n) { Array.new(n) { "_" } }
  end

  def grid
    @grid
  end

  def valid?(pos)
    return pos[0] <= @grid.length && pos[1] <= @grid.length
  end

  def empty?(pos)
    pos_value = @grid[pos[0]][pos[1]]
    return pos_value == "_"
  end

  def place_mark(position, mark)
    # p "[DEBUG] #{position}"
    # p "[DEBUG] #{valid?(position)}"
    # p "[DEBUG] #{empty?(position)}"
    if valid?(position) && empty?(position)
      @grid[position[0]][position[1]] = mark
    else
      raise ArgumentError.new "positon is not valid or not empty!"
    end
  end

  def print
    @grid.each do |sub_arr|
      puts sub_arr.join(" ")
    end
  end

  def win_row?(mark)
    @grid.any? do |sub_arr|
      sub_arr.all? do |ele|
        ele == mark
      end
    end

    # version2:
    # @grid.each do |sub_arr|
    #   check = true
    #   sub_arr.each do |ele|
    #     if elel != mark
    #       check = false
    #       break
    #     end
    #   end
    #   if check 
    #     return true
    #   end
    # end

    # return flase
  end

  def win_col?(mark)
    (0...@grid.length).each do |i|
      check = true
      (0...@grid.length).each do |j|
        if @grid[j][i] != mark
          check = false
          break
        end
      end
      
      if check
        return true
      end
    end

    return false
    # @grid.transpose.any? do |sub_arr|
    #   sub_arr.all? do |ele|
    #     ele == mark
    #   end
    # end
  end

  def win_diagonal?(mark)
    check_left = true
    check_right = true

    (0...@grid.length).each do |i|
      sub_arr = @grid[i]
      if sub_arr[i] != mark
        check_left = false
      end

      if sub_arr[sub_arr.length - 1 - i] != mark
        check_right = false
      end

    end
    
    if check_left == true || check_right == true
      return true
    else
      return false
    end
  end

  def win?(mark)
    if win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
      return true
    end

    return false
  end

  def empty_positions?
    return @grid.flatten.any? { |ele| ele == "_" }
  end

end

# b1 = Board.new(5)
# p b1

# # b1.valid?([1, 4])
# # b1.empty?([2, 1])
# b1.place_mark([0, 0], :O)
# b1.place_mark([1, 1], :X)
# b1.place_mark([0, 1], :O)
# b1.place_mark([0, 2], :O)
# b1.place_mark([1, 0], :O)
# b1.place_mark([2, 0], :O)

# b1.print
# p b1.win_row?(:O)

# p b1.win_col?(:O)
# p b1.win_diagonal?(:O)
# p b1.win_diagonal?(:X)
# p b1.win?(:O)
# p b1.win?(:X)
# p b1.empty_positions?
