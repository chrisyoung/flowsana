class Flow
  include ActiveModel::Model
  attr_accessor(:name)
  attr_accessor(:attributes)

  validates_presence_of :name

  def initialize(attributes, listener)
    @attributes     = attributes
    @listener       = listener
    super(attributes)
  end

  def valid?
    if super
      @listener.flow_valid(self)
      true
    else
      @listener.flow_invalid(self)
      false
    end
  end
end
