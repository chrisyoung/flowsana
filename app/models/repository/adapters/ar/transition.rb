module Repository
  module Adapters
    module AR
      class Transition < ActiveRecord::Base
        belongs_to :from,
        class_name: "Repository::Adapters::AR::Position"
        belongs_to :to,
        class_name: "Repository::Adapters::AR::Position"
      end
    end
  end
end
