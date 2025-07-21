class AssessDinos
  def initialize(dinos)
    @dinos = dinos
  end


  def evaluate
    @dinos.each { |dino| evaluate_dino(dino) }
    @dinos
  end


  private


  def evaluate_dino(dino)
    dino['health'] = find_health(dino)
    dino['comment'] = dino['health'] > 0 ? 'Alive' : 'Dead'
    dino['age_metrics'] = find_age_metrics(dino)
  end


  def find_health(dino)
    return 0 unless dino['age'] > 0


    base = 100 - dino['age']


    case dino['category']
    when 'herbivore'
      dino['diet'] == 'plants' ? base : base / 2
    when 'carnivore'
      dino['diet'] == 'meat' ? base : base / 2
    else
      0
    end
  end


  def find_age_metrics(dino)
    return 0 unless dino['comment'] == 'Alive' && dino['age'] > 1


    (dino['age'] / 2).to_i
  end
end
