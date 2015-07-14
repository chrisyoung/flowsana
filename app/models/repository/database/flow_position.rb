module Repository
  module Database
    class FlowPosition
      def initialize
        @adapter  = Repository::Adapters::AR::FlowPosition
        @model    = ::FlowPosition
      end

      def create(flow:, position:)
        flow_position = FlowPostion.new(flow: flow, position: position)
        if flow_position.save
          @listener.repository_create_flow_position_success(flow_position)
        end
      end
    end
  end
end
