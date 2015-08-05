module Repository::Adapters::AR::Data
  class Position < ActiveRecord::Base
    belongs_to :flow
    has_many :to_transitions, class_name: "Transition", foreign_key: :from_id
    has_many :from_transitions, class_name: "Transition", foreign_key: :to_id

    accepts_nested_attributes_for :to_transitions
  end
end
