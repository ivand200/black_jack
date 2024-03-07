# frozen_string_literal: true

require_relative 'participant'

class Dealer < Participant
  def initialize
    super('Dealer')
  end

  # def show_initial_hand
  #   "*" * hand.size
  # end

  def must_hit?
    score < 17
  end
end
