class Team
  # YOUR CODE GOES HERE
  attr_reader :name
  attr_accessor :rank, :wins, :losses
  def initialize(name)
    @name = name
    @wins = 0
    @losses = 0
    @rank = nil
  end
end
