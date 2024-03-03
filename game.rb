class Game
  attr_accessor :player, :dealer, :deck, :pot

  def initialize(player_name)
    @player = Player.new(player_name)
    @dealer = Dealer.new
    @deck = Deck.new
    @bank = Bank.new(100, 100)

    # Start the game
    def start
      loop do
        # setup_round
        # выбор игрока
        # ход дилера
        # определение победителя
        # повтор?
      end
    end

    private

    def setup_round
      # shuffle!
      # раздача карт
      # принятие ставок
    end

    def player_turn
      # запрос и обработка сообщений от игрокаб
      # 'hit', 'stand', 'open cards'
      end

    end

    def dealer_run
      puts "Dealer's turn..."
      # обработка действмй дилера
    end

    def show_initial_hands
      # показ карт игроком и дилером
    end

    def show_final_hands

    end

    def determine_outcome
      # Определение кто выйграл
    end

    def player_choice

    end

    def play_again?
      puts "Play again? (yes/no)"
    end

    def reset_game
      @deck = Deck.new
      bank.reset
    end
  end
