# frozen_string_literal: true

require_relative 'participant'
require_relative 'player'
require_relative 'dealer'
require_relative 'bank'
require_relative 'deck'
require_relative 'card'

class Game
  attr_accessor :player, :dealer, :deck, :pot, :bank

  def initialize(player_name)
    @player = Player.new(player_name)
    @dealer = Dealer.new
    @deck = Deck.new
    @bank = Bank.new(100, 100)
  end

  def start
    loop do
      setup_round
      player_turn
      dealer_turn unless player.busted?
      show_final_hands
      determine_outcome
      break unless play_again?
    end
    puts 'Thank you for playing!'
  end

  private

  def setup_round
    deck.shuffle!
    player.hand.clear
    dealer.hand.clear
    2.times { player.add_card(deck.deal_card) }
    2.times { dealer.add_card(deck.deal_card) }
    bank.place_bet(10, 10)
    show_initial_hands
  end

  def player_turn
    puts 'Your turn...'
    loop do
      choice = player_choice
      case choice
      when 'hit'
        player.add_card(deck.deal_card)
        puts 'You chose to hit.'
        show_hand(player)
        break if player.busted?
      when 'open cards'
        puts 'Opening cards...'
        break
      end
    end
  end

  def dealer_turn
    puts "Dealer's turn..."
    while dealer.must_hit?
      dealer.add_card(deck.deal_card)
      puts 'Dealer hits.'
      break if dealer.busted?
    end
    puts 'Dealer stands.' unless dealer.busted?
  end

  def show_initial_hands
    puts "Player's hand: #{player.show_hand} - Score: #{player.score}"
    puts "Dealer's hand: #{'*' * dealer.hand.size}"
  end

  def show_final_hands
    puts 'Final hands:'
    show_hand(player)
    puts "Dealer's hand: #{dealer.show_hand} - Score: #{dealer.score}"
  end

  def show_hand(participant)
    puts "#{participant.name}'s hand: #{participant.show_hand} - Score: #{participant.score}"
  end

  def determine_outcome
    if player.busted? || (dealer.score > player.score && !dealer.busted?)
      puts 'Dealer wins!'
      bank.payout_winner(:dealer)
    elsif dealer.busted? || player.score > dealer.score
      puts 'Player wins!'
      bank.payout_winner(:player)
    else
      puts "It's a tie!"
      bank.payout_winner(:tie)
    end
    puts bank.display_balance
  end

  def player_choice
    puts "Do you want to 'hit', 'stand', or 'open cards'?"
    gets.chomp.downcase
  end

  def play_again?
    puts 'Play again? (yes/no)'
    gets.chomp.downcase == 'yes'
  end

  def reset_game
    @deck = Deck.new
    bank.reset
  end
end
