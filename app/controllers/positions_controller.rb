class PositionsController < ApplicationController
  before_filter :get_new_position, only: :new
  before_filter -> { @use_cases = Rhag.new(self) }

  def index
    @use_cases[:get_positions].all
  end

  def create
    @use_cases[:create_position].create position_params
  end

  def edit
    @use_cases[:get_position].get params[:id]
    @use_cases[:get_positions].all
  end

  def update
    @use_cases[:get_position].get params[:id]
    @use_cases[:update_position].update @position, position_params
    @use_cases[:create_to_transitions, repo: 'transition'].create @position, position_params[:to_transitions]
  end

private

  listen_for(:get_position_success)          { |p| @position    = p }
  listen_for(:get_positions_success)         { |p| @positions   = p }
  listen_for(:list_transitions_for_success)  { |t| @transitions = t }
  listen_for(:update_position_success)       { |p| redirect_to positions_path }
  listen_for(:create_position_success)       { |p| redirect_to positions_path }
  listen_for(:create_to_transitions_success) { |t| @transitions = t}

  def get_new_position
    @position = Position.new
  end

  def position_params
    params.require(:position).permit :name, :to_transitions => [:to]
  end
end
