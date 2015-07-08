module Repository
  module Database
    class PositionDatabase
      def create(attributes)
        ::Position.new(self, attributes).tap do |position|
          if position.valid?
            ::Data::Position.create!(position.attributes)
      end

      def count
        ::Data::Position.count
      end

      def first
        ::Data::Position.first
      end
    end
  end
end
