require_relative "../spec_helper.rb"

describe Hand do
  # These UTF-8 characters will be useful for making different hands:
  # '♦', '♣', '♠', '♥'
  cards_1 = [Card.new("A", "♥"), Card.new("A", "♣")]
  cards_2 = [Card.new("A", "♥"), Card.new("10", "♣")]
  cards_3 = [Card.new("K", "♥"), Card.new("10", "♣")]
  cards_4 = [Card.new("7", "♥"), Card.new("5", "♣")]


  let(:hand) { Hand.new(cards_1) }
  let(:hand_two) { Hand.new(cards_2) }
  let(:hand_three) { Hand.new(cards_3) }
  let(:hand_four) { Hand.new(cards_4) }

  describe "#calculate_hand" do
    context "two ace cards" do
      it "expects two aces to equal 12" do
        # use `expect` to test assertions
        expect(hand.calculate_hand).to eq(12)
      end
    end
    context "ace and 10 card" do
      it "expects blackjack value of 21" do
        expect(hand_two.calculate_hand).to eq(21)
      end
    end

    context "K and 10 card" do
      it "expects value of 20" do
        expect(hand_three.calculate_hand).to eq(20)
      end
    end

    context "two regular cards" do
      it "expects a value of 12" do
        expect(hand_four.calculate_hand).to eq(12)
      end
    end
  end
end
