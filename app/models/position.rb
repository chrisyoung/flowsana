class Position
  include ActiveModel::Model
  attr_accessor :name
  attr_accessor :repository
  attr_accessor :to_transitions
  attr_accessor :from_transitions

  def initialize(attributes)
    @repository       = repository || Repository::PositionMemory.new
    @to_transitions   = []
    @from_transitions = []
    super(attributes)
  end

  def to_positions
    to_transitions.map {|transition| transition.to}
  end
end
