module Repository
  module Memory
    class Flow
      attr_accessor :listener

      def list
        @list ||= []
      end

      def find(flow)
        list.first do |listed_flow|
          flow == listed_flow
        end
      end

      def all
        @listener.flow_repository_all_success(@list)
      end

      def create(attributes)
        ::Flow.new(attributes).tap do |flow|
          if flow.valid?
            list << flow
            @listener.repository_create_flow_success(flow) if @listener
          else
            @listener.repository_create_flow_failure if @listener
          end
        end
      end

      def repository_create_flow_success
      end

      def count
        list.count
      end

      def first
        list.first
      end
    end
  end
end

