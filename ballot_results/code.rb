#build vote results
vote_results = []
4.times do |precinct_index|
  vote_results[precinct_index] = []
  3.times do |candidate_index|
    vote_results[precinct_index][candidate_index] = rand(20..500)
  end
end

candidates = [
  'Mary Sue',
  'Sally Jane',
  'Billy Joe'
]

#list out vote results
vote_results.each_with_index do |precinct_results, precinct_index|
  puts "**In precinct #{precinct_index + 1}:**"

  candidates.each_with_index do |candidate, candidate_index|
    puts "* #{candidate} got #{vote_results[precinct_index][candidate_index]} votes"
  end

  puts ""
end

### put your code here
# How many people voted in precinct 1?
total_votes = 0
vote_results[0].each do |votes|
  total_votes += votes
end
puts "Total votes in Precinct 1: #{total_votes}"

# Who was the winning candidate in Precinct 4?
highest = 0
winner = 0
vote_results[3].each_with_index do |votes, index|
  if votes > highest
  highest = votes
  winner = index
  end
end
puts "#{candidates[winner]} won Precinct 4 with #{highest} votes!"

vote_totals = {
  :mary => 0,
  :sally => 0,
  :billy => 0
}

# How many people voted for Mary Sue?
vote_results.each do |votes|
  vote_totals[:mary] += votes[0]
  vote_totals[:sally] += votes[1]
  vote_totals[:billy] += votes[2]
end
puts "#{vote_totals[:mary]} people voted for Mary Sue"
puts "#{vote_totals[:billy]} people voted for Billy Joe"
puts "#{vote_totals[:sally]} people voted for Sally Jane"

# How many people voted in total?
total_votes = 0
vote_totals.each do |candidate, votes|
  total_votes += votes
end
puts "Total votes: #{total_votes}"

# Who had the most votes?
if vote_totals[:mary] > vote_totals[:billy] && vote_totals[:mary] > vote_totals[:sally]
  puts "Mary had the most votes: #{vote_totals[:mary]}"
elsif vote_totals[:sally] > vote_totals[:mary] && vote_totals[:sally] > vote_totals[:billy]
  puts "Sally had the most votes: #{vote_totals[:sally]}"
else
  puts "Billy had the most votes: #{vote_totals[:billy]}"
end
