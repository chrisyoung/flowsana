module AR
  class Flow < ActiveRecord::Base
    has_many :positions
  end
end