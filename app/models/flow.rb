class Flow
  include ActiveModel::Model
  attr_accessor(:name)
  attr_accessor(:attributes)

  validates_presence_of :name
end
