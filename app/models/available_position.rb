class AvailablePosition
  include ActiveModel::Model
  attr_accessor :attributes, :id

  def initialize(attributes={})
    @attributes = attributes
    super(attributes)
  end

  def persisted?
    id.present?
  end
end
