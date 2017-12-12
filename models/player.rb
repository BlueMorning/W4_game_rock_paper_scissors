class Player

  attr_reader :weapon

  def initialize(nb_wins)
    @win      = false
    @weapon   = nil
    @nb_wins  = nb_wins
  end

  #Method used to randomly define the weapon for the computer player
  def set_random_weapon(weapons_array)
    @weapon = weapons_array[Random.new.rand(0..(weapons_array.length-1)]
  end

end
