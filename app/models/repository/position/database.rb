module Repository
  module Position
    class Database
      def initialize(listener)
        @listener = listener
      end

      def create(attributes)
        ::FirstPosition.new(self, attributes).valid?
      end

      def position_valid(position, flow)
        ::AR::Position.create!(position.attributes)
        @listener.repository_create_success(position)
      end

      def count
        ::AR::Position.count
      end

      def first
        ::AR::Position.first
      end
    end
  end
end
