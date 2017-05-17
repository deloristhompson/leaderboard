
require 'spec_helper'

RSpec.describe Leaderboard do
  let(:leaderboard) { Leaderboard.new}
  describe ".new" do
    it "has a name" do
      expect(leaderboard.teams).to eq(leaderboard.name)
    end

    it "returns Team name" do
      expect(leaderboard.team_objects[0].name).to eq("Packers")
    end

    it "returns wins" do
      expect(leaderboard.team_objects[2].wins).to eq(1)
    end

    it "returns losses" do
      expect(leaderboard.team_objects[3].losses).to eq(1)
    end

    it "returns rank" do
      expect(leaderboard.team_objects[0].rank).to eq(1)
    end

    it "returns game summary" do
      expect(leaderboard.team_game_summary("Packers")).to eq("Packers played 3 games\nThey played as the home team against the Vikings and won: 38 to 25.\nThey played as the home team against the Giants and won: 23 to 16.\nThey played as the away team against the Vikings and lost: 17 to 14.\n\n")
    end
  end
end
