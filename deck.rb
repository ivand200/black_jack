class Deck
  SUITS = ['♠', '♥', '♦', '♣']
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  attr_accessor :cards

  def initialize
    @cards = []
    SUITS.each do |suit|
      VALUES.each do |value|
        @cards << Card.new(suit, value)
      end
    end
    shuffle!
  end

  def shuffle!
    cards.shuffle!
  end

  def deal_card
    cards.pop
  end
end