require("sinatra")
require("sinatra/contrib/all") if development?()
require("pry-byebug")
require("./../models/game")
require("./../models/player")



get('/homepage') do

end

# Routing to the weapon choice for the round
get('draw_your_weapon/round/:current_round/:nb_rounds/score/:player1/:player2') do
  current_round   = params[:current_round].to_i
  nb_rounds       = params[:nb_round].to_i
  score_player_1  = params[:player1].to_i
  score_player_2  = params[:player2].to_i

  @game = Game.new(current_round, nb_rounds, Player.new(score_player_1), Player.new(score_player_2))

end

# Route to the result page of the round
get('result_round/round/:current_round/:nb_rounds/score/:player1/:player2/weapon/:weapon') do
  current_round   = params[:current_round].to_i
  nb_rounds       = params[:nb_round].to_i
  score_player_1  = params[:player1].to_i
  score_player_2  = params[:player2].to_i
  weapon          = params[:weapon].to_i

  @game = Game.new(current_round, nb_rounds, Player.new(score_player_1, weapon), Player.new(score_player_2))
  @game.battle()

  if(@game.is_game_over)
    erb(:game_over)
  else
    erb(:game)
  end


end

# Route to the final score
get('final_result/nb_rounds/:nb_rounds/final_score/:player1/:player2') do
  nb_rounds       = params[:nb_round].to_i
  score_player_1  = params[:player1].to_i
  score_player_2  = params[:player2].to_i

  @game = Game.new(nb_rounds, nb_rounds, Player.new(score_player_1, weapon), Player.new(score_player_2))

end
