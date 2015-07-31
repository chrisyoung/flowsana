class Transition
  include ActiveModel::Model
  attr_accessor :to, :from, :id, :from_id, :to_id, :description, :attributes

  def initialize(attributes)
    @attributes = attributes
    super(attributes)
  end
end
