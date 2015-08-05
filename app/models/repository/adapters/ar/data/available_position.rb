module Repository::Adapters::AR::Data
  class AvailablePosition < ActiveRecord::Base
    self.table_name = "Positions"
    scope :excluding_positions, -> (positions) do
      where.not(id: positions.map(&:id))
    end
  end
end
