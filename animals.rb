# Classe Animal simples (sem ActiveRecord)
class Animal
  attr_accessor :name, :age, :species, :weight

  @@count = 0

  def initialize(name, age, species, weight)
    @name = name
    @age = age
    @species = species
    @weight = weight
    @@count += 1
  end

  def to_s
    "Nome: #{@name}, Idade: #{@age || 'N/A'} anos, Espécie: #{@species}, Peso: #{@weight || 'N/A'} kg"
  end 

  def self.count_animals_created
    @@count
  end

  def message_for_animal
    "Olá, meu nome é #{@name}, tenho #{@age} anos e sou um #{@species}."
  end

  def self.fetch_animals_available(animals)
    animals.to_a.to_json
  end
end

CONSULTATION_VALUE = 50.0

def handle_count_animals(animals)
  count = animals.count
  { message: "Existem #{count} animais na base de dados." }
end

def calculate_consult(animals, name)
  animals.each do |animal|
    next if animal.age.nil? || animal.weight.nil?
    if animal.name == name
      if animal.age >= 4 && animal.age <= 9 && animal.weight > 4.0
        value = CONSULTATION_VALUE * 4
      elsif (animal.age >= 10 && animal.weight > 4.0) || (animal.weight >= 12.0)
        value = CONSULTATION_VALUE * 8
      else
        value = CONSULTATION_VALUE
      end
      return { message: "O valor da consulta para #{name} é R$#{value}" }
    end
  end
  { message: "Animal #{name} não encontrado." }
end
