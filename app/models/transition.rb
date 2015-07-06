class Transition
  include ActiveModel::Model
  attr_accessor :from
  attr_accessor :to

  def initialize(listener, attributes)
    @listener = listener
    super(attributes)

    @from.to_transitions << self
    @to.from_transitions << self
  end

  def valid?
    if super
      @listener.transition_valid(self)
      true
    else
      @listener.transition_invalid(self)
      false
    end
  end
end
