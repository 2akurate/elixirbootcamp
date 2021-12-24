defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

test "create makes 20 cards" do
  deck_length = length(Cards.create)
  assert deck_length == 20
end

test "shuffling randomizes deck" do
  deck = Cards.create
  assert deck != Cards.shuffle(deck)
end

end
