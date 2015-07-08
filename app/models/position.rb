class Position
  include ActiveModel::Model

  attr_accessor :name, :repository, :to_transitions, :from_transitions

  def initialize(attributes)
    @to_transitions   = []
    @from_transitions = []
    super(attributes)
  end

  def to_positions
    to_transitions.map { |transition| transition.to }
  end
end
