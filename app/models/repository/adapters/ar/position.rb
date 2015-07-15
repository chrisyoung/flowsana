module Repository
  module Adapters
    module AR
      class Position < ActiveRecord::Base
        belongs_to :flow

        has_many :from_transitions,
          class_name: "Repository::Adapters::AR::Transition",
          foreign_key: :from_id

        has_many :to_transitions,
          class_name: "Repository::Adapters::AR::Transition",
          foreign_key: :to_id

        has_many :froms, through: :from_transitions,
          class_name: "Repository::Adapters::AR::Position"

      end
    end
  end
end
