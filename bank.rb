# frozen_string_literal: true

class Bank
  attr_accessor :player_balance, :dealer_balance, :pot

  def initialize(player_initial_balance, dealer_initial_balance)
    @player_balance = player_initial_balance
    @dealer_balance = dealer_initial_balance
    @pot = 0
  end

  def place_bet(player_bet, dealer_bet)
    @player_balance -= player_bet
    @dealer_balance -= dealer_bet
    @pot = player_bet + dealer_bet
  end

  def payout_winner(winner)
    case winner
    when :player
      @player_balance += @pot
    when :dealer
      @dealer_balance += @pot
    when :tie
      @player_balance += @pot / 2
      @dealer_balance += @pot / 2
    end
    @pot = 0
  end

  def reset
    @pot = 0
  end

  def display_balance
    "Player balance: $#{player_balance}, Dealer balance: $#{dealer_balance}"
  end
end
