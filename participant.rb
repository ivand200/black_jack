# frozen_string_literal: true

class Participant
  attr_accessor :hand, :name

  def initialize(name = 'Dealer')
    @hand = []
    @name = name
  end

  def add_card(card)
    hand << card
  end

  def score
    total = 0
    aces = 0
    hand.each do |card|
      if card.face_value == 'Ace'
        aces += 1
        total += 11
      else
        total += card.face_value
      end
    end

    # Коректоровка для тузов если score больше 21
    aces.times do
      total -= 10 if total > 21
    end
    total
  end

  def busted?
    score > 21
  end

  def show_hand
    hand.map(&:to_s).join(', ')
  end
end
