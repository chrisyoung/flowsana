class Flow
  include ActiveModel::Model
  attr_accessor :name, :attributes, :id

  def initialize(attributes={})
    @attributes = attributes
    super(attributes)
  end

  validates_presence_of :name
end
