dinner_total = 178
tip = [15, 18, 20, 25].sample.to_f
dinner_tip = (tip / 100 ) * dinner_total
puts "You should tip $#{dinner_tip}"
