require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/turn'
require './lib/card'
require 'pry'

class DeckTest < Minitest::Test

  def setup
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [card_1, card_2, card_3]
  end

  def test_deck_exists
    deck = Deck.new(@cards)

    assert_instance_of Deck, deck
  end

  def test_deck_has_cards
    deck = Deck.new(@cards)

    assert_equal @cards, deck.cards
  end

  def test_deck_how_many_cards
    deck = Deck.new(@cards)

    assert_equal @cards.count, deck.count
  end

  def test_cards_in_stem_category
    deck = Deck.new(@cards)

    assert_equal [@cards[1], @cards[2]], deck.cards_in_category(:STEM)
  end

  def test_cards_in_geography_category
    deck = Deck.new(@cards)

    assert_equal [@cards[0]], deck.cards_in_category(:Geography)
  end

  def test_cards_in_non_existent_category
    deck = Deck.new(@cards)

    assert_equal [], deck.cards_in_category(:Philosophy)
  end
end
