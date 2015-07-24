module Repository::Adapters::AR::Data
  class Position < ActiveRecord::Base
    belongs_to :flow
  end
end
