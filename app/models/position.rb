class Position
  include ActiveModel::Model

  attr_accessor :id, :name, :repository, :to_transitions, :from_transitions,
    :to_positions, :from_positions, :attributes

  def initialize(attributes=nil)
    @to_transitions   = []
    @from_transitions = []
    @to_positions     = []
    @from_positions   = []
    super(attributes)
  end

  def persisted?
    id.present?
  end

  def to_positions
    to_transitions.map { |transition| transition.to }
  end

  def from_positions
    from_transitions.map { |transition| transition.from }
  end

end
