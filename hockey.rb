require 'rubygems'
require 'mysql2'
game_no = ARGF.argv[0]

client = Mysql2::Client.new(username: "alih", database: "alih")

result_game = client.query("SELECT id,start_at,venue FROM games WHERE no=#{game_no}")

result_game.each(as: :hash) do |game|
  game_id = game["id"]
  game_time = game["start_at"].to_s
  game_venue = game["venue"].to_s
  printf("ゲーム NO: #{game_no} 開催日時: #{game_time[0..18]} 会場: #{game_venue}\n")


  result_goals_team = client.query("SELECT teams.name, count(goals.id) FROM goals join(players,teams) on(goals.player_id=players.id and players.team_id=teams.id) WHERE goals.game_id=#{game_id} group by teams.name ORDER BY count(goals.id) ASC")
  teams = []
  result_goals_team.each(as: :hash) do |team|
    teams << team
  end
  printf("対戦チーム: #{teams[0]["name"]} vs #{teams[1]["name"]}\n")
  printf("勝敗:  #{teams[0]["count(goals.id)"]}- #{teams[1]["count(goals.id)"]} : #{teams[1]["name"]}の勝ち\n")

  printf("ゴール:\n")
  result_goals = client.query("SELECT goals.goal_time, players.name, teams.nickname FROM goals join(players,teams) on(goals.player_id=players.id and players.team_id=teams.id) WHERE goals.game_id=#{game_id} order by goals.goal_time")
  result_goals.each(as: :hash) do |goal|
    goal_time = goal["goal_time"].to_s
    printf("  #{goal_time[14..18]} #{goal["name"]} (#{goal["nickname"]})\n")
  end
end

client.close