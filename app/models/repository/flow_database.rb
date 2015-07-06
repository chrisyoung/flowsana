module Repository

  class FlowDatabase
    def create(attributes)
      ::Flow.new(attributes, self).valid?.tap do |flow|
        ::AR::Flow.create! flow.attributes
      end
    end

    def count
      ::AR::Flow.count
    end

    def first
      ::AR::Flow.first
    end
  end
end
