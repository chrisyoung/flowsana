class PositionsController < ApplicationController
  before_filter :get_new_position, only: :new
  before_filter -> { @domain_driver = DomainDriven::Driver.new(self) }

  def index
    @domain_driver[:get_positions].all
  end

  def create
    @domain_driver[:create_position].create position_params
  end

  def edit
    @domain_driver[:get_position].get params[:id]
    @domain_driver[:get_available_positions].get @position
  end

  def update
    @domain_driver[:get_position].get params[:id]
    @domain_driver[:update_position].update @position, position_params
  end

private

  listen_for(:get_position_success)    { |p| @position  = p }
  listen_for(:get_positions_success)   { |p| @positions = p }
  listen_for(:update_position_success) { |p| redirect_to positions_path }
  listen_for(:create_position_success) { |p| redirect_to positions_path }
  listen_for(:get_available_positions_success) do |to_positions, from_positions|
    @to_positions   = to_positions
    @from_positions = from_positions
  end

  def get_new_position
    @position = Position.new
  end

  def position_params
    params.require(:position).permit :name,
      to_transitions:   [:to_id, :from_id],
      from_transitions: [:to_id, :from_id]
  end
end
