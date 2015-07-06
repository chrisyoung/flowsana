module Repository
  class FlowMemory
    def initialize
      @list     = []
    end

    def create(attributes)
      ::Flow.new(attributes).tap do |flow|
        return unless flow.valid?
        @list << flow
      end
    end

    def count
      @list.count
    end

    def first
      @list.first
    end
  end
end
