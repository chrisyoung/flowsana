class Flow
  include ActiveModel::Model
  attr_accessor :name, :attributes, :id
  validates_presence_of :name

  def initialize(attributes={})
    @attributes = attributes
    super(attributes)
  end
end
