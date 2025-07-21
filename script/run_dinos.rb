
require_relative "../assess_dinos"
require_relative "../summary_dinos"


def run(dinos)
  assessed = AssessDinos.new(dinos).evaluate
  summary = DinoSummary.new(assessed).summarize_dem_dinos


  { dinos: assessed, summary: summary }
end


dinodata = run([
  { "name" => "DinoA", "category" => "herbivore", "period" => "Cretaceous", "diet" => "plants", "age" => 100 },
  { "name" => "DinoB", "category" => "carnivore", "period" => "Jurassic", "diet" => "meat", "age" => 80 }
])


puts dinodata