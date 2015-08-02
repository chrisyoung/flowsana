module Repository::Adapters::AR::Data
  class Transition < ActiveRecord::Base
    belongs_to :to, class_name: "Position"
    belongs_to :from, class_name: "Position"
  end
end
