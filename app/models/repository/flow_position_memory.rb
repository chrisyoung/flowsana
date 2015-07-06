module Repository
  class FlowPositionMemory
    def initialize
      @list = []
    end

    def create(attributes:)
      ::FlowPosition.new(attributes).tap do |flow_position|
        return unless flow_position.valid?
        @list << flow_position
      end
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
