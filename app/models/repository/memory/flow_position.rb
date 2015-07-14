module Repository
  module Memory
    class FlowPosition
      attr_accessor :listener

      def initialize(listener=nil)
        @listener = listener
        @list = []
      end

      def create(flow:, position:)
        ::FlowPosition.new(flow: flow, position: position).tap do |flow_position|
          return unless flow_position.valid?
          @list << flow_position
          return unless @listener
          @listener.repository_create_flow_position_success(flow_position)
        end
      end

      def clear
        @list = []
      end

      def count
        @list.count
      end

      def get(flow:)
        flow_positions(flow)
      end

      def flow_positions(flow)
        @list.collect do |flow_position|
          if flow_position.flow == flow
            flow_position.position
          end
        end.compact
      end
    end
  end
end
