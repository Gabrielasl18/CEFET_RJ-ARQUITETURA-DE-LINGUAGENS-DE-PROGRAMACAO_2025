require_relative './lib/animals.rb'
require_relative './lib/veterinarian.rb'

# --------  class Animals -------- 

# Criando alguns animais "em memória"
animals = Array.new 
animals << Animal.new("Rex", 5, "cachorro", 6.0)
animals << Animal.new("Juju", 12, "gato", 5.0)
animals << Animal.new("Bola", nil, "papagaio", 0.5) 
animals << Animal.new("Tobby", 3, "cachorro", 14.0)

puts "\n-------- ACESSANDO UMA POSIÇÃO NO ARRAY ATRAVÉS DO ÍNDICE --------"
puts animals[0]
puts animals[1]
puts animals[2]
puts animals[3]

puts "\n-------- ACESSANDO AS VARIÁVEIS DE INSTÂNCIA ATRAVÉS DOS ATRIBUTOS ACESSÍVEL / GET E SET -------- "
puts animals[0].name
puts animals[1].name
puts animals[2].name
puts animals[3].name

puts "\n-------- ACESSANDO MÉTODOS DA CLASSE --------\n"
puts Animal.fetch_animals_available(animals)
puts handle_count_animals(animals)
puts

# --------  class Veterinário -------- 

# Criando um veterinário com 12 anos de experiência
vet = Veterinarian.new("Maria", "cardiologia", 12)

# Associando animais ao veterinário, filtrando só animais válidos e com peso > 5
animals.each do |animal|
  next if animal.age.nil? || animal.weight.nil?
  vet.add_animal(animal) if animal.weight > 5
end

# puts vet.profile
# puts vet.animals_report
# puts vet.consult_animal(animals, "Rex")
# puts vet.consult_animal(animals, "Juju")
# puts vet.consult_animal(animals, "Bola")
# puts vet.consult_animal(animals, "Tobby")
# puts vet.consult_animal(animals, "Mia")