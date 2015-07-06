module Repository

  class FlowDatabase
    def create(attributes)
      ::Flow.new(attributes).tap do |flow|
        return unless flow.valid?
        ::Data::Flow.create!(flow.attributes).tap do |flow|
          flow.id = ar.id
        end
      end
    end

    def count
      ::Data::Flow.count
    end

    def first
      ::Data::Flow.first
    end

    def find(id: id)
      Flow.new(::Data::Flow.find(id).attributes)
    end
  end
end
