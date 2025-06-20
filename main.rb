require_relative 'animals.rb'
require_relative 'veterinarian.rb'


# Criando alguns animais "em memória"
animals = []
animals << Animal.new("Rex", 5, "cachorro", 6.0)
puts animals[0]
animals << Animal.new("Mia", 12, "gato", 5.0)
animals << Animal.new("Bola", nil, "papagaio", 0.5)  # idade nil para testar next
animals << Animal.new("Tobby", 3, "cachorro", 14.0)

# Criando um veterinário com 12 anos de experiência
vet = Veterinarian.new("Maria", "cardiologia", 12)

# Associando animais ao veterinário, filtrando só animais válidos e com peso > 5
animals.each do |animal|
  next if animal.age.nil? || animal.weight.nil?
  vet.add_animal(animal) if animal.weight > 5
end

puts vet.profile
puts vet.animals_report

puts handle_count_animals(animals)
puts vet.consult_animal(animals, "Rex")
puts vet.consult_animal(animals, "Mia")
puts vet.consult_animal(animals, "Bola")
puts vet.consult_animal(animals, "Tobby")
puts vet.consult_animal(animals, "NãoExiste")