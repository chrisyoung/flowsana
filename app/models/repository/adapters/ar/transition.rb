module Repository::Adapters::AR
  class Transition
    def initialize(listener)
      @listener = listener
      @data     = Repository::Adapters::AR::Data::Transition
    end

    def list(position)
      @listener.transition_adapter_list_success(
        @data.where(from_id: position.id).map do |transition|
          ::Transition.new(
            transition.attributes.merge(
              to:   transition.to,
              from: transition.from))
        end
      )
    end

    def get(id)
      ar_transition = @data.includes(:to, :from).find(id)
      transition = ::Transition.new(ar_transition.attributes)
      transition.to   = ar_transition.to
      transition.from = ar_transition.from
      @listener.transition_adapter_get_success(transition)
    end

    def create(attributes)
      data_model = @data.create(attributes)

      @listener.transition_adapter_create_success(
        ::Transition.new(data_model.attributes))
    end

  end
end
