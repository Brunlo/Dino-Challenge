class DinoSummary
  def initialize(dinos)
    @dinos = dinos
  end


  def summarize_dem_dinos
    summary = {}


    @dinos.group_by { |dino| dino['category'] }.each do |category, dino_list|
      summary[category] = dino_list.size
    end


    summary
  end
end
