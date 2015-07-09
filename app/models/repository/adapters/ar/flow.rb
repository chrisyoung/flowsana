module Repository
  module Adapters
    module AR
      class Flow < ActiveRecord::Base
        has_many :positions
      end
    end
  end
end



