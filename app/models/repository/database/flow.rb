module Repository
  module Database
    class Flow
      attr_accessor :listener, :adapter, :model

      def initialize
        @adapter  = Repository::Adapters::AR::Flow
        @model    = ::Flow
      end

      def create(attributes)
        @model.new(attributes).tap do |flow|
          return unless flow.valid?
          @adapter.create!(flow.attributes).tap do |flow_data|
            flow.id = flow_data.id
            @listener.flow_repository_create_success(flow)
          end
        end
      end

      def all
        @listener.flow_repository_all_success(@adapter.all)
      end

      def count
        ::Flow.count
      end

      def first
        @adapter.first
      end

      def find(id: id)
        ::Flow.new @adapter.find(id).attributes
      end
    end
  end
end
