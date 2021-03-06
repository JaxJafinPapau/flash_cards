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

  def number_correct_by_category(category)
    category_correct = 0
    @turns.each do |turn|
      if turn.guess == card.answer && turn.category == category
        category_correct += 1
      end
    end
  end

  def percent_correct
    number_correct.to_f / @turns.count.to_f
  end

  def percent_correct_by_category(category)
      total_in_category = @turns.find_all do |turn|
                            turn.category == category
                          end
      total_in_category.count.to_f / number_correct_by_category.to_f
  end
end
