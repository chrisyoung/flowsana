class Flow
  include ActiveModel::Model
  attr_accessor(:name)
  attr_accessor(:first_position)
  attr_accessor(:attributes)

  validates_presence_of :name

  def initialize(attributes, listener)
    @attributes     = attributes
    @listener       = listener
    @first_position = []
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
