# frozen_string_literal: true

class Card
  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def to_s
    "#{value}#{suit}"
  end

  def face_value
    case value
    when 'J', 'Q', 'K'
      10
    when 'A'
      11
    else
      value.to_i
    end
  end
end
