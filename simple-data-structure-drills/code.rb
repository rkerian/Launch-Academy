require 'pry'

transactions = [50_000, -2_000, -25_000, 4_000, -12_000, 5_000, -800, -900, 43_000, -30_000, 15_000, 62_000, -50_000, 42_000]

# Write Ruby code to find out the answers to the following questions:

# * What is the value of the first transaction?
transactions.first

# * What is the value of the second transaction?
transactions[1]

# * What is the value of the fourth transaction?
transactions[3]

# * What is the value of the last transaction?
transactions[-1]
# * What is the value of the second from last transaction?
transactions[-2]
# * What is the value of the 5th from last transaction?
transactions[-5]
# * What is the value of the transaction with index 5?
transactions[5]
# * How many transactions are there in total?
transactions.count
# * How many positive transactions are there in total?
transactions.count {|number| number > 0}
# * How many negative transactions are there in total?
transactions.count {|number| number < 0}
# * What is the largest withdrawal?
transactions.min
# * What is the largest deposit?
transactions.max
# * What is the small withdrawal?
s_with = -100000000000000
transactions.each do |number|
  if number > s_with && number < 0
    s_with = number
  end
end

# * What is the smallest deposit?
s_dep = 1000000000000000
transactions.each do |deposit|
  if deposit > 0 && deposit < s_dep
    s_dep = deposit
  end
end

# * What is the total value of all the transactions?
total = 0
transactions.each do |transaction|
  total += transaction
end

# * If Dr. Dre's initial balance was $239,900 in this account, what is the value of his balance after his last transaction?
balance = 239_900
balance += total

best_records = {
 "Tupac"=>"All Eyez on Me",
 "Eminem"=>"The Marshall Mathers LP",
 "Wu-Tang Clan"=>"Enter the Wu-Tang (36 Chambers)",
 "Led Zeppelin"=>"Physical Graffiti",
 "Metallica"=>"The Black Album",
 "Pink Floyd"=>"The Dark Side of the Moon",
 "Pearl Jam"=>"Ten",
 "Nirvana"=>"Nevermind"
 }

# Write Ruby code to find out the answers to the following questions:

# * How many records are in `best_records`?
best_records.length

# * Who are all the artists listed?
best_records.each_key {|artist| puts artist}

# * What are all the album names in the hash?
best_records.each_value {|record| puts record}

# * Delete the `Eminem` key-value pair from the list.
best_records.delete("Eminem")

# * Add your favorite musician and their best album to the list.
best_records["Joshua Radin"]="The Rock and the Tide"

# * Change `Nirvana`'s album to another.
best_records["Nirvana"]="Some Nirvana Album"

# * Is `Nirvana` included in `best_records`?
best_records.include?("Nirvana")

# * Is `Soundgarden` included in `best_records`?
best_records.include?("Soundgarden")

# * If `Soundgarden` is not in `best_records` then add a key-value pair for the band.
if !best_records.include?("Soundgarden")
  best_records["Soundgarden"]="Some Soundgarden Album"
end

# * Which key-value pairs have a key that has a length less than or equal to 6 characters?
short_records = 0
best_records.each_pair do |artist, record|
  if artist.length + record.length <= 6
    short_records += 1
  end
end

# * Which key-value pairs have a value that is greater than 10 characters?
long_records = 0
best_records.each_pair do |artist, record|
  if artist.length + record.length >= 10
    long_records += 1
  end
end

binding.pry
