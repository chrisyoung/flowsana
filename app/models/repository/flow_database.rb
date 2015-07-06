module Repository

  class FlowDatabase
    def initialize(listener)
      @listener = listener
    end

    def create(attributes)
      ::Flow.new(attributes, self).valid?
    end

    def flow_valid(model)
      ::AR::Flow.create! model.attributes
      @listener.repository_create_success
    end

    def flow_invalid(model)
      @listener.repository_create_failure
    end

    def count
      ::AR::Flow.count
    end

    def first
      ::AR::Flow.first
    end
  end
end
