class FirstPosition
  include ActiveModel::Model
  attr_accessor :name
  attr_accessor :flow
  attr_accessor :repository
  attr_accessor :attributes

  def initialize(listener, attributes)
    @repository = repository || Repository::Position::Memory.new(self)
    @flow       = flow
    @listener   = listener
    @attributes = attributes
    super(attributes)
  end

  def valid?
    if super
      @listener.position_valid(self, flow)
      true
    else
      @listener.position_invalid(self)
      false
    end
  end
end
