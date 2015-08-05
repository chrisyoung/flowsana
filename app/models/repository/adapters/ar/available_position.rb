module Repository::Adapters::AR
  class AvailablePosition
    def initialize(listener)
      @listener = listener
      @data     = Repository::Adapters::AR::Data::Position
    end

    def find(id)
      @listener.available_position_adapter_find_success(
        make_model(@data.find(id)))
    end

    def create(attributes)
      @listener.available_position_adapter_create_success(
        make_model(@data.create(attributes)))
    end

    def all(position)
      @listener.available_position_adapter_all_success(
        make_models(@data.excluding_to_positions(position)),
        make_models(@data.excluding_from_positions(position))
      )
    end

    private

    def make_models(ar_positions)
      ar_positions.map {|position| make_model(position)}
    end

    def make_model(position)
      ::Position.new(position.attributes)
    end
  end
end
