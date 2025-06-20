require 'json'

class Veterinarian
  attr_accessor :name, :specialty, :experience_years, :animals

  def initialize(name, specialty, experience_years)
    @name = name
    @specialty = specialty
    @experience_years = experience_years
    @animals = []
  end

  def add_animal(animal)
    @animals << animal
  end

  def profile
    "Veterinário #{@name}, especialidade em #{@specialty}, com #{@experience_years} anos de experiência."
  end

  def animals_report
    return "Nenhum animal associado." if @animals.empty?

    report = @animals.map do |animal|
      "#{animal.name} - #{animal.species}, #{animal.age} anos, #{animal.weight} kg"
    end
    "Animais associados:\n" + report.join("\n")
  end

  def consult_animal(animals, animal_name)
    result = calculate_consult(animals, animal_name) # agora retorna um Hash, não string JSON

    if result[:message].include?("não encontrado")
      "#{@name} não conseguiu encontrar o animal chamado #{animal_name}."
    else
      "#{@name} realizou a consulta. #{result[:message]}"
    end
  end
end