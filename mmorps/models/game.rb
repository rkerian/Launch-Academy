class Game

  attr_reader :ai_choice, :flash_message

  def initialize
    @ai_choice = nil
    @round_result = nil
  end

def self.process_turn(user_choice, ai_choice)

  if user_choice == ai_choice
    @round_result = 2
    #flash messages - 0 = computer, 1 = player, 2 = tie

  elsif ai_choice == "Rock" && user_choice == "Scissors"
    #computer wins
    @round_result = 0

  elsif ai_choice == "Scissors" && user_choice == "Paper"
    #computer wins
    @round_result = 0

  elsif ai_choice == "Paper" && user_choice == "Rock"
    #computer wins
    @round_result = 0

  elsif user_choice == "Rock" && ai_choice == "Scissors"
    #player wins
    @round_result = 1

  elsif user_choice == "Scissors" && ai_choice == "Paper"
    #player wins
    @round_result = 1

  else
    #player chose scissors, computer choise rock0
    #Player wins
    @round_result = 1
  end
  @round_result
end

#look at both scores
#determine win or tie for each round
#rock over scissors
#scissors over paper
#paper over rock0
#decide what to return for winner (P or C?)
#modify score based on result
def message
  #determine the message, message will be called in server.rb
end

def won?
#determine who wins the game
#keep track of number of wins
# 2/3 wins the whole game
# if game is won, return winner and reset game score to 0/0
end

end
