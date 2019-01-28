require './lib/card'
require './lib/turn'
require './lib/deck'
require 'pry'

class Round
  attr_reader :deck,
              :turns,
              :turn,
              :turn_number

  def initialize(deck)
    @deck = deck
    @turns = []
    @turn_number = 0
  end

  def current_card
    @turns[@turn_number]
  end

  def take_turn(guess)
    @turns << Turn.new(@guess, @card)
    @turn_number += 1
    return @turns
  end

  def number_correct
    total_correct = 0
    @turns.each do |turn|
      if turn.guess == card.answers
        total_correct += 1
      end
    end
    return total_correct
  end
end
