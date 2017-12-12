require("sinatra")
require("sinatra/contrib/all") if development?()
require("pry-byebug")
require_relative("./models/game")
require_relative("./models/player")



get('/home') do

  @link_play_3_rounds  = "/game/1/3/0/0"
  @link_play_5_rounds  = "/game/1/5/0/0"
  @link_play_9_rounds =  "/game/1/9/0/0"

  erb(:home)

end

get('/game/:current_round/:nb_rounds/:player1/:player2') do
  current_round   = params[:current_round].to_i
  nb_rounds       = params[:nb_rounds].to_i
  score_player_1  = params[:player1].to_i
  score_player_2  = params[:player2].to_i

  @game           = Game.new(current_round, nb_rounds, Player.new(score_player_1), Player.new(score_player_2))

  @rock_link      = "/game/#{current_round}/#{nb_rounds}/#{score_player_1}/#{score_player_2}/#{@game.rock()}"
  @paper_link     = "/game/#{current_round}/#{nb_rounds}/#{score_player_1}/#{score_player_2}/#{@game.paper()}"
  @scissors_link  = "/game/#{current_round}/#{nb_rounds}/#{score_player_1}/#{score_player_2}/#{@game.scissors()}"

  erb(:game)

end

# Route to the result page of the round
get('/game/:current_round/:nb_rounds/:player1/:player2/:weapon') do
  current_round   = params[:current_round].to_i
  nb_rounds       = params[:nb_rounds].to_i
  score_player_1  = params[:player1].to_i
  score_player_2  = params[:player2].to_i
  weapon          = params[:weapon]

  @game           = Game.new(current_round, nb_rounds, Player.new(score_player_1, weapon), Player.new(score_player_2))

  @game.battle()

  @rock_link      = "/game/#{@game.current_round}/#{@game.nb_rounds_to_play}/#{@game.player_1.nb_wins}/#{@game.player_2.nb_wins}/#{@game.rock()}"
  @paper_link     = "/game/#{@game.current_round}/#{@game.nb_rounds_to_play}/#{@game.player_1.nb_wins}/#{@game.player_2.nb_wins}/#{@game.paper()}"
  @scissors_link  = "/game/#{@game.current_round}/#{@game.nb_rounds_to_play}/#{@game.player_1.nb_wins}/#{@game.player_2.nb_wins}/#{@game.scissors()}"
  @play_again     = "/home"

  erb(:game)
end
