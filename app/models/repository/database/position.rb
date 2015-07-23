module Repository
  module Database
    class Position
      attr_accessor :listener, :adapter, :model

      def initialize
        @adapter  = Repository::Adapters::AR::Position
        @model    = ::Position
      end

      def list
        @listener.repository_get_success(adapter.all) if @listener
      end

      def get(id)
        position = Repository::Adapters::AR::Position.find(id)
        return unless position
        @listener.position_repository_get_success(::Position.new(position.attributes))
      end

      def create(attributes)
        ::Position.new(attributes).tap do |position|
          return unless position.valid?
          listener.position_repository_create_success(
            Repository::Adapters::AR::Position.create!(attributes))
        end
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
