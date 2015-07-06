class Transition
  include ActiveModel::Model
  attr_accessor :to, :from

  def initialize(attributes)
    super(attributes)

    @from.to_transitions << self
    @to.from_transitions << self
  end
end
