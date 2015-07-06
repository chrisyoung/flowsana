class Transition
  include ActiveModel::Model
  attr_accessor :from
  attr_accessor :to

  def initialize(attributes)
    super(attributes)

    @from.to_transitions << self
    @to.from_transitions << self
  end
end
