module Repository
  module Database
    class Position
      attr_accessor :listener, :adapter, :model

      def initialize
        @adapter  = Repository::Adapters::AR::Position.new
        @model    = ::Position
      end

      def list
        @listener.repository_get_success(adapter.all) if @listener
      end

      def get(id)
        @listener.position_repository_get_success(adapter.find(id))
      end

      def create(attributes)
        listener.position_repository_create_success(adapter.create(attributes))
      end
    end
  end
end
