module Repository
  module Database
    class Position
      attr_accessor :listener, :adapter, :model

      def initialize
        @adapter = Repository::Adapters::AR::Position.new(self)
        @model   = ::Position
      end

      def list
        adapter.all
      end

      def get id
        adapter.find(id)
      end

      def create attributes
        adapter.create(attributes)
      end

      def position_adapter_all_success positions
        listener.repository_get_success positions
      end

      def position_adapter_create_success position
        listener.position_repository_create_success position
      end

      def position_adapter_find_success position
        listener.position_repository_get_success position
      end
    end
  end
end
