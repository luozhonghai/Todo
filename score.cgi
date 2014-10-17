require 'cgi'
require 'rubygems'
require 'mysql2'
#!/usr/bin/env ruby

client = Mysql2::Client.new(username: "alih", database: "alih")
cgi = CGI.new


print cgi.header
puts "<html><head><title>Score</title></head>"
puts "<body>"

result_home_team = client.query(
  "SELECT games.no, teams.name, count(goals.id) FROM games
  JOIN teams ON (teams.id = games.home_id)
  LEFT JOIN (goals, players) ON (goals.game_id = games.id AND goals.player_id = players.id AND players.team_id = teams.id)
  GROUP BY games.no, teams.name 
  ORDER BY games.no"
  )

result_visitor_team = client.query(
  "SELECT games.no, teams.name, count(goals.id) FROM games
  JOIN teams ON (teams.id = games.visitor_id)
  LEFT JOIN (goals, players) ON (goals.game_id = games.id AND goals.player_id = players.id AND players.team_id = teams.id)
  GROUP BY games.no, teams.name 
  ORDER BY games.no"
  )
puts "<table border=1>"
puts "<tr><th>No.</th><th>Home team</th><th>goal</th><th>Visitor team</th><th>goal</th></tr>"

game_nos = []
home_teams = []
home_goals = []
visitor_teams = []
visitor_goals = []

result_home_team.each(as: :hash) do |res|
    game_nos << res["no"].to_s
    home_teams << res["name"].to_s
    home_goals << res["count(goals.id)"].to_s
end

result_visitor_team.each(as: :hash) do |res|
    visitor_teams << res["name"].to_s
    visitor_goals << res["count(goals.id)"].to_s
end

val = cgi['n'].to_i
if val > 0 && val <= game_nos.length
    puts "<tr>"
    puts "<td align=right>#{val}</td>
          <td>#{home_teams[val]}</td>
          <td align=right>#{home_goals[val]}</td>
          <td>#{visitor_teams[val]}</td>
          <td align=right>#{visitor_goals[val]}</td>" 
    puts "</tr>"
else
  game_nos.each_with_index do |game_no, idx|
    puts "<tr>"
    puts "<td align=right>#{game_no}</td>
          <td>#{home_teams[idx]}</td>
          <td align=right>#{home_goals[idx]}</td>
          <td>#{visitor_teams[idx]}</td>
          <td align=right>#{visitor_goals[idx]}</td>"
    puts "</tr>"
  end
end
puts "</table>"
puts "</body></html>"



client.close

