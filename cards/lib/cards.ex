defmodule Cards do
  @moduledoc """
  Provides methods for creating and handling a deck of cards.
  """


  @doc """
  Returns a list of a strings representing a deck of cards.
  """
  def create do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for value <- values, suit <- suits do
        "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Determines wether a deck contains a given card.

    ##Examples

      iex> deck = Cards.create()
      iex> Cards.contains?(deck, "Ace of Spades")
      true
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Divides a deck into a hand and the remainder of the deck.
  The `hand_size` argument indicates how big the hand is.

  ## Examples

      iex> deck = Cards.create()
      iex> {hand, _} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, reason} -> "Error: #{reason}"
    end
  end

  def load2(filename) do
    {status, value} = File.read(filename)

      case status do
      :ok -> :erlang.binary_to_term value
      :error -> "Error: #{value}"
    end
  end

  def t(hand_size) do
    deck = create()
    deck = shuffle(deck)
    {hand, _}=deal(deck, hand_size)
    hand
  end

  def t2(hand_size) do
    Cards.create
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

end
