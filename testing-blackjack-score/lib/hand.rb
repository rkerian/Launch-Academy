require_relative 'deck'

class Hand
  def initialize(cards)
    @cards = cards
  end

  def calculate_hand
    # Your code here after writing tests
    # Think about what this method needs to do
    total = 0
    count_array = []
    @cards.map do |card|
      current_card = card.to_s.chop
      if current_card == 'K' || current_card == 'Q' || current_card == 'J'
        count_array << 10
      else
        count_array << current_card
      end
    end

    if count_array.include?('A')
      # stuff for ace in hand here
      if count_array[0] == 'A' && count_array[1] == 'A'
        #if two aces, total = 12, otherwise bust
        total = 12
      else
        ace_index = count_array.find_index('A')
        ace_index == 0 ? non_ace_card = count_array[1] : non_ace_card = count_array[0]
        non_ace_card = non_ace_card.to_i
        11 + non_ace_card > 21 ? total = non_ace_card + 1 : total = non_ace_card + 11
      end
    else
      count_array.map do |card|
        if card == "J" || card == 'K' || card == 'Q'
          total += 10
        else
          total += card.to_i
        end
      end
    end
    total
  end
end

deck = Deck.new
cards = deck.deal(2)
hand = Hand.new(cards)
# hand.calculate_hand # Get this working properly
