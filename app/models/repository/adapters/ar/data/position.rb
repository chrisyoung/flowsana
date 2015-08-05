module Repository::Adapters::AR::Data
  class Position < ActiveRecord::Base
    belongs_to :flow
    has_many   :to_transitions, class_name: "Transition", foreign_key: :from_id
    has_many   :from_transitions, class_name: "Transition", foreign_key: :to_id

    scope :excluding_to_positions, -> (position) do
      where.not(id: [position.id] + position.to_positions.map(&:id))
    end

    scope :excluding_from_positions, -> (position) do
      where.not(id: [position.id] + position.from_positions.map(&:id))
    end

    accepts_nested_attributes_for :to_transitions
    accepts_nested_attributes_for :from_transitions
  end
end
