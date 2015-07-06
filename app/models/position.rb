class Position
  include ActiveModel::Model
  attr_accessor :name
  attr_accessor :repository
  attr_accessor :to_transitions
  attr_accessor :from_transitions

  def initialize(listener, attributes)
    @repository       = repository || Repository::Position::Memory.new(self)
    @listener         = listener
    @to_transitions   = []
    @from_transitions = []
    super(attributes)
  end

  def to_positions
    to_transitions.map {|transition| transition.to}
  end

  def valid?
    if super
      @listener.position_valid(self)
      true
    else
      @listener.position_invalid(self)
      false
    end
  end
end
