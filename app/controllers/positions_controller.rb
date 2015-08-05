class PositionsController < ApplicationController
  before_filter :get_new_position, only: :new
  before_filter -> { @use_case = Rhag::UseCase.new(self) }

  def index
    @use_case[:get_positions].all
  end

  def create
    @use_case[:create_position].create position_params
  end

  def edit
    @use_case[:get_position].get params[:id]
    @use_case[:get_available_positions].get @position
  end

  def update
    @use_case[:get_position].get params[:id]
    @use_case[:update_position].update @position, position_params
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
    params.require(:position).permit :name, :to_transitions => [:to_id, :from_id]
  end
end
