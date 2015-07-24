module Repository
  module Adapters
    module AR
      module Data
        class Position < ActiveRecord::Base
          belongs_to :flow
        end
      end
    end
  end
end
