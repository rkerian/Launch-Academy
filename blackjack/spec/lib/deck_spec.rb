require_relative "../spec_helper.rb"

describe Deck do
  let(:deck) { Deck.new } # creates a variable that can be used for tests

  describe "#build_deck" do
    it "builds a deck of 52 cards" do
      expect(deck.cards.size).to eq 52
    end

    it "creates unique cards" do
      expect(deck.cards.uniq.size).to eq 52
    end

    it "shuffles deck aftering being built" do
      comparison_deck = Deck.new
      expect(deck.cards[0]).not_to eq comparison_deck.cards[0]
      #how do I compare card object to card object?
    end
  end

  describe "#deal" do
    it "removes correct number of cards" do
      original_size = deck.size
      cards = deck.deal(2)
      new_size = deck.size
      expect(new_size).to eq (original_size - 2)
    end

    it "deals the top card in the deck" do
      correct_card = deck.cards[-1]
      expect(deck.deal(1)).to eq [correct_card]
    end
  end
end
