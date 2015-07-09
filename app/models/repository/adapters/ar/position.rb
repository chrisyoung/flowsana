module Repository
  module Adapters
    module ActiveRecord
      class Position < ActiveRecord::Base
        belongs_to :flow
      end
    end
  end
end
