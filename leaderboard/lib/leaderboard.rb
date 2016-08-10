require_relative "../spec/spec_helper"
require_relative "team.rb"

class Leaderboard
GAME_INFO = [
    {
      home_team: "Patriots",
      away_team: "Broncos",
      home_score: 17,
      away_score: 13
    },
    {
      home_team: "Broncos",
      away_team: "Colts",
      home_score: 24,
      away_score: 7
    },
    {
      home_team: "Patriots",
      away_team: "Colts",
      home_score: 21,
      away_score: 17
    },
    {
      home_team: "Broncos",
      away_team: "Steelers",
      home_score: 11,
      away_score: 27
    },
    {
      home_team: "Steelers",
      away_team: "Patriots",
      home_score: 24,
      away_score: 31
    }
]
# YOUR CODE GOES HERE

  def initialize
    # Add team names to an @teams object array
    @teams = []
    GAME_INFO.each do |game|
      team_h = game[:home_team]
      team_a = game[:away_team]
      @teams << Team.new(team_h) if !@teams.any?{ |team| team.name == team_h }
      @teams << Team.new(team_a) if !@teams.any?{ |team| team.name == team_a }
    end

    # Add wins and losses to teams within @teams
    GAME_INFO.each do |game|
      team_h = game[:home_team]
      team_a = game[:away_team]
      score_h = game[:home_score]
      score_a = game[:away_score]

      home_change_index = @teams.find_index { |team| team.name == team_h }
      away_change_index = @teams.find_index { |team| team.name == team_a }

      if score_h > score_a
        @teams[home_change_index].add_win
        @teams[away_change_index].add_loss
      elsif score_a > score_h
        @teams[home_change_index].add_loss
        @teams[away_change_index].add_win
      end
    end

    @teams.sort_by!{ |team| team.wins }.reverse!
    @teams.each_with_index do |team, index|
      team.rank = index + 1
    end
  end

  def display
    puts "-------------------------------------------------"
    puts "| Name     Rank     Total Wins     Total Losses |"
    @teams.each do |team|
      puts "| #{team.name}   #{team.rank}          #{team.wins}               #{team.losses}       |"
    end
    puts "-------------------------------------------------"
  end
end
