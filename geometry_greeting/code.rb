def greet(name, language)
  greetings = {
    "English" => "Hi",
    "Spanish" => "Hola",
    "Italian" => "Ciao",
    "French" => "Bonjour"
  }
  puts "#{greetings[language]} #{name}."
end

greet("Ryan", "Spanish")
