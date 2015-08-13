module Repository::Adapters::AR
  class Transition
    def initialize(listener)
      @listener = listener
      @data     = Repository::Adapters::AR::Data::Transition
    end

    def get id
      record = @data.find(id)
      t = ::Transition.new(record.attributes)
      t.to = ::Position.new(record.to.attributes)
      t.from = ::Position.new(record.from.attributes)
      @listener.transition_adapter_get_success(t)
    end

    def create(attributes)
      @listener.transition_adapter_create_success(
        ::Transition.new(@data.create(attributes).attributes))
    end

    def update(id, attributes)
      record = @data.find(id)
      record.update_attributes(attributes)

      @listener.transition_adapter_update_success(
        ::Transition.new(record.attributes)
      )
    end

    def list
      # @listener.adapter_create_success(
      #   ::Transition_adapter_create_success(@data.all))
    end

    def all
      @listener.transition_adapter_all_success(
        @data.all.map {|transition| ::Transition.new(transition.attributes)})
    end
  end
end
