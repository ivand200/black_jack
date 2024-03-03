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
    # Выплата победителю
  end

  def reset
    @pot = 0
  end

  def display_balance
    "Player balance: $#{player_balance}, Dealer balance: $#{dealer_balance}"
  end
end