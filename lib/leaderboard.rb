
require_relative 'Team'
class Leaderboard
  attr_accessor :name, :teams, :rank, :wins, :losses
  attr_reader :name, :team_objects

  GAME_INFO = [
    {
      home_team: "Packers",
      away_team: "Vikings",
      home_score: 38,
      away_score: 25
    },
    {
      home_team: "Packers",
      away_team: "Giants",
      home_score: 23,
      away_score: 16
    },
    {
      home_team: "Vikings",
      away_team: "Packers",
      home_score: 17,
      away_score: 14
    },
    {
      home_team: "Vikings",
      away_team: "Giants",
      home_score: 24,
      away_score: 10
    },
    {
      home_team: "Giants",
      away_team: "Cowboys",
      home_score: 10,
      away_score: 7
    }
  ]


  def initialize
    teams = []
    @team_objects = []

    GAME_INFO.each do |game|
      if teams.include?(game[:home_team]) == false
        teams << game[:home_team]
      end

      if teams.include?(game[:away_team]) == false
        teams << game[:away_team]
      end
    end

    teams.each do |new_team|
      @team_objects << Team.new(new_team)
    end

    @total_wins = 0
    GAME_INFO.each do |game|
      @team_objects.each do |team|
        if team.name == game[:home_team]
          if game[:home_score] > game[:away_score]
            team.wins += 1
            @total_wins = team.wins + team.losses
          else
            @total_wins += team.wins + team.losses
            team.losses += 1
          end
        elsif team.name == game[:away_team]
          if game[:home_score] > game[:away_score]
            team.losses += 1
          else
            team.wins += 1
          end
        end
      end
    end

    count = 1
    @team_objects.each do |team|
      team.rank = count
      count += 1
    end
  end

  def after_team_spacer(length)
    correct_spaces = 13 - length
    " " * correct_spaces
  end

  def team_name(name)
    "#{name}#{after_team_spacer(name.length)}"
  end

  def team_row(team)
    "|#{team_name(team.name)}#{team.rank}    #{team.wins}          #{team.losses}           |\n"
  end

  def to_s
    word = ""
    word += "------------------------------------------\n"
    word += "|Name       Rank  Total Wins  Total Losses|\n"
    @team_objects.each do |team|
      word += team_row(team)
    end
    word += "------------------------------------------"
  end

  def team_game_summary(teams)
    words = ""
    @team_objects.each do |team|
      words += "#{teams} played #{@total_wins} games\n"
      break
    end

    GAME_INFO.each do |games|
      if teams == games[:home_team]
        words += "They played as the home team against the #{games[:away_team]} and won: #{games[:home_score]} to #{games[:away_score]}.\n"
      elsif teams == games[:away_team]
        words += "They played as the away team against the #{games[:home_team]} and lost: #{games[:home_score]} to #{games[:away_score]}.\n"
      end
    end
    "#{words}\n"
  end
end

first_team = Leaderboard.new
second_team = Leaderboard.new
third_team = Leaderboard.new

puts first_team
puts first_team.team_game_summary("Packers")
puts second_team.team_game_summary("Vikings")
puts third_team.team_game_summary("Giants")
