require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require 'pry'

class TurnTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  end

  def test_turn_exists
    turn = Turn.new("Juneau", @card_1)

    assert_instance_of Turn, turn
  end

  def test_turn_has_a_card
    turn = Turn.new("Juneau", @card_1)

    assert_equal @card_1, turn.card
  end

  def test_turn_has_a_guess
    turn = Turn.new("Juneau", @card_1)

    assert_equal "Juneau", turn.guess
  end

  def test_the_guess_is_correct
    turn = Turn.new("Juneau", @card_1)

    assert_equal true, turn.correct?
  end

  def test_does_turn_give_feedback
    turn = Turn.new("Juneau", @card_1)

    assert_equal "Correct!", turn.feedback
  end
end
