require 'spec_helper'
require_relative "../assess_dinos"
require_relative "../summary_dinos"
require_relative "../script/run_dinos"

RSpec.describe "Dino Tests" do
  let(:dinos) do
    [
      { "name" => "DinoA", "category" => "herbivore", "period" => "Cretaceous", "diet" => "plants", "age" => 100 },
      { "name" => "DinoB", "category" => "carnivore", "period" => "Jurassic", "diet" => "meat", "age" => 80 }
    ]
  end

  describe "calculating dino health" do
    it "returns correct health values based on age, category, and diet" do
      result = run(dinos)
      expect(result[:dinos][0]["health"]).to eq(0)
      expect(result[:dinos][1]["health"]).to eq(20)
    end
  end

  describe "setting the comment for dinos" do
    it "marks dinos as 'Alive' or 'Dead' depending on their health" do
      result = run(dinos)
      expect(result[:dinos][0]["comment"]).to eq("Dead")
      expect(result[:dinos][1]["comment"]).to eq("Alive")
    end
  end

  describe "calculating age metrics" do
    it "computes age_metrics only for alive dinos older than 1" do
      result = run(dinos)
      expect(result[:dinos][0]["age_metrics"]).to eq(0)
      expect(result[:dinos][1]["age_metrics"]).to eq(40)
    end
  end

  describe "summarizing dinos by category" do
    it "returns a count of dinos grouped by their category" do
      result = run(dinos)
      expect(result[:summary]).to eq({ "herbivore" => 1, "carnivore" => 1 })
    end
  end
end

