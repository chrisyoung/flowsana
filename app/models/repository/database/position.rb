module Repository
  module Database
    class Position
      attr_accessor :listener

      def initialize
        @adapter = Repository::Adapters::AR
      end

      def create(attributes)
        ::Position.new(attributes).tap do |position|
          if position.valid?
            record = @adapter::Position.create!(attributes)
            position.id = record.id
            @listener.position_repository_create_success(position)
          end
        end
      end

      def all
        @listener.position_repository_all_success(@adapter::Position.all)
      end

      def read(id)
        record = @adapter::Position.find(id)
        @listener.position_repository_read_success(record)
      end

      def count
        @adapter::AR::Position.count
      end

      def first
        @adapter::AR::Position.first
      end
    end
  end
end
