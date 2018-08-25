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

  private
    def handle_fill(symbol)
      @symbol = symbol
      return @filled = true
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

  private
    def symbol_valid?(symbol)
      ['O', 'X', '!', '@', '#', '$', '%', '&'].include?(symbol)
    end
end

squares = (1..9).map { |i| Square.new(i) }

player_1 = Player.new("Cody", "X")
player_2 = Player.new("Danielle", "X")

p player_1
p player_2
