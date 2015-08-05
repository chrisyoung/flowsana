module Repository::Adapters::AR
  class Position
    def initialize(listener)
      @listener      = listener
      @position_data = Repository::Adapters::AR::Data::Position
      @model         = ::Position
    end

    def find(id)
      result = @position_data.find(id)

      position = make_model(result)
      position.to_transitions   = result.to_transitions
      position.from_transitions = result.from_transitions

      @listener.send :position_adapter_find_success, position
    end

    def create(attributes)
      @listener.send :position_adapter_create_success,
        make_model(@position_data.create(attributes))
    end

    def update(position, attributes)
      normalize_attributes(attributes)

      @position_data.find(position.id).tap do |ar_position|
        ar_position.update_attributes(attributes)

        @listener.send :position_adapter_update_success, make_model(ar_position)
      end
    end

    def all
      @listener.send :position_adapter_all_success,
        @position_data.all.map {|position| make_model(position)}
    end

    private

    def make_model(ar_position)
      @model.new(ar_position.attributes)
    end

    def normalize_attributes(attributes)
      attributes[:to_transitions_attributes] = attributes.delete(:to_transitions) || []
      attributes[:from_transitions_attributes] = attributes.delete(:from_transitions) || []
    end
  end
end
