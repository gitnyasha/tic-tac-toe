class Board
  attr_accessor :board
  attr_reader :combination

  def initialize
    @combination = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def move(game_is_running, picked)
    board[picked - 1] = if game_is_running
      'X'
    else
      'O'
    end
  end

  def win?
    @combination.each do |x|
      return 'X' if (@board[x[0]] == 'X') && (@board[x[1]] == 'X') && (@board[x[2]] == 'X')
      return 'O' if (@board[x[0]] == 'O') && (@board[x[1]] == 'O') && (@board[x[2]] == 'O')
    end
    false
  end

  def draw?
    @board.any? Integer
  end
end

class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end
end