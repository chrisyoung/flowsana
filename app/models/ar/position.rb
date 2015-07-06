module AR
  class Position < ActiveRecord::Base
    belongs_to :flow
  end
end
