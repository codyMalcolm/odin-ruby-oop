class Square
  attr_reader :index, :filled, :symbol
  def initialize(index)
    @index = index
    @filled = false
  end

  public
    def fill(symbol)
      @filled ? false : handle_fill(symbol)
    end

    def reset
      @filled = false
      @symbol = nil
    end

  private
    def handle_fill(symbol)
      @symbol = symbol
      @filled = true
    end
end

class Player
  attr_reader :name, :symbol

  @@opponent_symbol = nil
  def initialize(name, symbol)
    @name = name;
    symbol = symbol.lstrip.chr
    if symbol == @@opponent_symbol
      @symbol = @@opponent_symbol == 'X' ? 'O' : 'X'
      puts "#{@@opponent_symbol} was selected by your opponent."
    else
      if symbol_valid?(symbol)
        @symbol = symbol
      else
        @symbol = @@opponent_symbol == 'X' ? 'O' : 'X'
        puts "\"#{symbol}\" was not a valid symbol"
      end
    end
    @@opponent_symbol ||= @symbol
    puts "#{@name} will play with #{@symbol}'s"
  end

  public
    def self.clear
      @@opponent_symbol = nil
    end

  private
    def symbol_valid?(symbol)
      ['O', 'X', '!', '@', '#', '$', '%', '&'].include?(symbol)
    end
end

play_again_flag = true
$squares = (1..9).map { |i| Square.new(i) }

def invalid_response
  puts "That entry was invalid."
end

def valid_play_again?(response)
  ['y', 'n'].include?(response)
end

def another_game
  play_again = nil
  until valid_play_again?(play_again)
    puts "Would you like to play again? (y/n)"
    play_again = gets.chomp.lstrip.chr.downcase
    invalid_response unless valid_play_again?(play_again)
  end
  play_again
end

def player_setup(number)
  puts "Who is player #{number}?"
  player_name = gets.chomp
  puts "What symbol would #{player_name} like to use? ('O', 'X', '!', '@', '#', '$', '%', '&')"
  player_symbol = gets.chomp
  player = Player.new(player_name, player_symbol)
end

def display_board
  puts ""
  puts "    #{$squares[0].symbol || "1"} | #{$squares[1].symbol || "2"} | #{$squares[2].symbol || "3"}"
  puts "   -----------"
  puts "    #{$squares[3].symbol || "4"} | #{$squares[4].symbol || "5"} | #{$squares[5].symbol || "6"} "
  puts "   -----------"
  puts "    #{$squares[6].symbol || "7"} | #{$squares[7].symbol || "8"} | #{$squares[8].symbol || "9"}"
  puts ""
end

def valid_square?(selection, symbol)
  index = selection.to_i
  return false unless [1,2,3,4,5,6,7,8,9].include?(index)
  $squares[index-1].fill(symbol)
end

def did_player_win?
  winning_sequences =
    [[0,3,6], [1,4,7], [2,5,8], [0, 4, 8], [2, 4, 6],
    [0, 1, 2], [3, 4, 5], [6, 7, 8]]

  winning_sequences.any? do |sequence|
    $squares[sequence[0]].filled &&
    $squares[sequence[0]].symbol == $squares[sequence[1]].symbol &&
    $squares[sequence[0]].symbol == $squares[sequence[2]].symbol
  end
end

def did_players_tie?
  $squares.all? { |s| s.filled }
end

while play_again_flag do
  Player.clear
  $squares.each { |s| s.reset }
  $player_1 = player_setup('one')
  $player_2 = player_setup('two')
  $player_1_turn = rand < 0.5

  game_finished = false

  def current_player
    $player_1_turn ? "#{$player_1.name}(#{$player_1.symbol})" : "#{$player_2.name}(#{$player_2.symbol})"
  end

  def play_turn
    display_board
    puts "It's #{current_player}'s turn."
    puts "Please select the square you would like to mark."
    selection = gets.chomp.lstrip.chr
    player_symbol = $player_1_turn ? $player_1.symbol : $player_2.symbol

    until valid_square?(selection, player_symbol)
      puts "That was a not a valid selection. Please select one of the available squares."
      selection = gets.chomp.lstrip.chr
    end

    $player_1_turn = !$player_1_turn
  end

  puts "#{current_player} will go first."

  temp = 0

  until game_finished
    play_turn
    game_finished = did_player_win? || did_players_tie?
  end

  display_board

  puts did_player_win? ? "#{$player_1_turn ? $player_2.name : $player_1.name} wins this round!" : "The game is a draw!"

  play_again_flag = another_game == 'y'
end
