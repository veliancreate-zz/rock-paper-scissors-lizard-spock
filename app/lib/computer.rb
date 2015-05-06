class Computer
  attr_accessor :selection

  # need selection method over a selection accessor
  # so that the random selection is not called every time.
  # need the accessor for the test

  def selection
    @selection = [:rock, :paper, :scissors, :lizard, :spock].sample
  end
end
