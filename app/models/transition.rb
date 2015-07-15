class Transition
  include ActiveModel::Model
  attr_accessor :to, :from, :attributes, :id

  def initialize(attributes)
    super(attributes)
  end
end
