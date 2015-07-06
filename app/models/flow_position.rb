class FlowPosition
  include ActiveModel::Model
  attr_accessor :flow, :position

  def initialize(listener:, attributes:)
    super(attributes)
  end
end
