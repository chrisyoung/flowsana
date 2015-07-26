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

      def position_adapter_all_success(position)
        listener.repository_get_success(position)
      end

      def get id
        adapter.find(id)
      end

      def update(position, attributes)
        adapter.update(position, attributes)
      end

      def create attributes
        adapter.create(attributes)
      end

      def position_adapter_update_success position
        listener.position_repository_update_success(position)
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
