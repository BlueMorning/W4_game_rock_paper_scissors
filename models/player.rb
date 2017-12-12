class Player

  attr_reader :weapon
  attr_accessor :nb_wins

  def initialize(nb_wins, weapon = nil)
    @win      = false
    @weapon   = weapon
    @nb_wins  = nb_wins
  end

  #Method used to randomly define the weapon for the computer player
  def set_random_weapon(weapons_array)
    @weapon = weapons_array[Random.new.rand(0..(weapons_array.length-1))]
  end

end
