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
  puts "    #{$squares[0].symbol || " "} | #{$squares[1].symbol || " "} | #{$squares[2].symbol || " "}"
  puts "   -----------"
  puts "    #{$squares[3].symbol || " "} | #{$squares[4].symbol || " "} | #{$squares[5].symbol || " "} "
  puts "   -----------"
  puts "    #{$squares[6].symbol || " "} | #{$squares[7].symbol || " "} | #{$squares[8].symbol || " "}"
  puts ""
end


while play_again_flag do
  Player.clear
  player_1 = player_setup('one')
  player_2 = player_setup('two')
  player_1_turn = rand < 0.5

  game_finished = false

  def current_player(bool, p1, p2)
    bool ? "#{p1.name}(#{p1.symbol})" : "#{p2.name}(#{p2.symbol})"
  end

  puts "#{current_player(player_1_turn, player_1, player_2)} will go first."

  until game_finished
    display_board

    game_finished = true

  end

  play_again_flag = another_game == 'y'
end
