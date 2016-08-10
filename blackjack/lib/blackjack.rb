require_relative "deck"
require_relative "hand"
require_relative "card"

# player = Hand.new
# computer = Hand.new
# Your code here...
# in real life we wouldn't just initialize here
# we could play infinitely and would need to
# accont for cards played to shuffle/play from new decks
deck = Deck.new

puts "Welcome to our fun game of blackjack. Good luck!"

def new_round(deck)
  #logic to define each round
  player_total = player_turn(deck)
  if player_total > 21
    puts "Dealer wins. Player bust."
  else
    dealer_total = dealer_turn(deck)
    winner?(player_total, dealer_total)
  end
end

def player_turn(deck)
  hand = Hand.new(deck.deal(2))
  display_cards("Player", hand.cards)
  hand_total = hand.calculate_hand
  stop_flag = false
    until hand_total > 21 || stop_flag == true
      puts "\nPlayer score: #{hand_total}"
      print "\nHit or stand? (h/s) >"
      choice = gets.strip.downcase
      if choice == 's'
        stop_flag = true
        puts "Standing at #{hand_total}"
      elsif choice == 'h'
        new_card = deck.deal(1)
        hand.add_card(new_card)
        display_cards("Player", new_card)
        hand_total = hand.calculate_hand
        puts "Player score is #{hand_total}"
        puts "BUST!\n" if hand_total > 21
      else
        puts "User error/invalid entry."
      end
    end
    hand_total
end

def dealer_turn(deck)
  puts "\nDealer's turn\n"
  hand = Hand.new(deck.deal(2))
  display_cards("Dealer", hand.cards)
  hand_total = hand.calculate_hand
  puts "\nDealer score is: #{hand_total}\n"
  while hand_total < 17
    new_card = deck.deal(1)
    hand.add_card(new_card)
    display_cards("Dealer", new_card)
    hand_total = hand.calculate_hand
    puts "Dealer score is: #{hand_total}\n"
    puts "BUST!\n" if hand_total > 21
  end
    hand_total
end

def display_cards(player, cards)
  cards.map do |card|
    puts "#{player} was dealt #{card.rank}#{card.suit}"
  end
end

def winner?(player_total, dealer_total)
  if player_total > 21
    puts "\nPlayer bust. Dealer wins."
  elsif dealer_total > 21
    puts "\nDealer bust. Player wins."
  elsif player_total == 21 && dealer_total == 21
    puts "\nTie."
  elsif player_total == 21
    puts "\nYou win."
  elsif dealer_total == 21
    puts "\nDealer wins."
  elsif player_total == dealer_total
    puts "\nTie."
  else
    player_delta = 21 - player_total
    dealer_delta = 21 - dealer_total
     if player_delta < dealer_delta
       puts "\nPlayer wins."
     else
       puts "\nDealer wins."
     end
  end
end
