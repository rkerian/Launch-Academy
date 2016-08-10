holes = [
  {par: 5, score: 7},
  {par: 4, score: 5},
  {par: 3, score: 3},
  {par: 4, score: 4},
  {par: 4, score: 4},
  {par: 3, score: 2},
  {par: 4, score: 5},
  {par: 5, score: 5},
  {par: 4, score: 5},
  {par: 5, score: 7},
  {par: 4, score: 4},
  {par: 4, score: 4},
  {par: 3, score: 3},
  {par: 4, score: 5},
  {par: 4, score: 5},
  {par: 4, score: 4},
  {par: 3, score: 3},
  {par: 5, score: 6}
]

total_strokes = 0
total_par = 0

holes.each do |hole|
  total_strokes += hole[:score]
  total_par += hole[:par]
end

puts "Total Strokes: #{total_strokes}."
puts "Total Par: #{total_par}."

if total_strokes < total_par
  puts "You scored #{total_strokes - total_par} under Par."
elsif total_strokes > total_par
  puts "You scored #{total_par - total_strokes} over Par."
else
  puts "You scored on Par."
end
