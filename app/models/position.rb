class Position
  include ActiveModel::Model

  attr_accessor :name, :repository, :to_transitions, :from_transitions,
    :attributes, :id

  def initialize(attributes=nil)
    @to_transitions   = []
    @from_transitions = []
    super(attributes)
  end

  def flows_from
    from_transitions.map {|transition| transition.from_position}
  end

  def to_positions
    to_transitions.map { |transition| transition.to }
  end
end
