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

end

square_one = Square.new(1)

puts square_one.index
puts square_one.filled
puts square_one.symbol

puts square_one.fill('@')

puts square_one.index
puts square_one.filled
puts square_one.symbol

puts square_one.fill('$')

puts square_one.index
puts square_one.filled
puts square_one.symbol
