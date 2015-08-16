module Repository::Adapters::AR
  class Sequence
    def initialize(listener)
      @listener = listener
      @data     = Repository::Adapters::AR::Data::Sequence
    end

    def read id
      @listener.sequence_adapter_read_success(
        ::Sequence.new(@data.find(id).attributes))
    end

    def create(attributes)
      @listener.sequence_adapter_create_success(
        ::Sequence.new(@data.create(attributes).attributes))
    end

    def update(id, attributes)
      record = @data.find(id)
      record.update_attributes(attributes)

      @listener.sequence_adapter_update_success(
        ::Sequence.new(record.attributes)
      )
    end

    def list
      @listener.sequence_adapter_list_success(@data.all)
    end

    def all
      @listener.sequence_adapter_all_success(
        @data.all.map {|sequence| ::Sequence.new(sequence.attributes)})
    end
  end
end
