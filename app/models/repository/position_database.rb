module Repository
  class PositionDatabase
    def create(attributes)
      ::Position.new(self, attributes).tap do |position|
        if position.valid?
          ::AR::Position.create!(position.attributes)
    end

    def count
      ::AR::Position.count
    end

    def first
      ::AR::Position.first
    end
  end
end
