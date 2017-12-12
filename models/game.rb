require_relative("player")

# Class which manages the game, player_1 is human and player_2 is the computer
class Game

  WEAPONS = ["rock", "paper", "scissors"]

  def initialize(current_round, nb_rounds_to_play, player_1, player_2)
    @current_round     = current_round
    @nb_rounds_to_play = nb_rounds_to_play
    @player_1          = player_1
    @player_2          = player_2
  end

  def battle()

    @player_2.set_random_weapon(WEAPONS)

    if (@player_1.weapon == @player_2.weapon)
      @player_1.nb_wins += 1
      @player_2.nb_wins += 1
    elsif (@player_1.weapon == "rock"     && @player_2.weapon == "scissors" ||
           @player_1.weapon == "paper"    && @player_2.weapon == "rock")    ||
           @player_1.weapon == "scissors" && @player_2.weapon == "paper")
      @player_1.nb_wins += 1
    else
      @player_2.nb_wins += 1
    end

    current_round+=1

  end

  def is_game_over
    return current_round == nb_rounds_to_play
  end

end
