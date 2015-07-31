class PositionsController < ApplicationController
  before_filter :init_use_cases
  before_filter :get_new_position, only: :new

  listen_for(:get_position_success)          { |p| @position    = p }
  listen_for(:get_positions_success)         { |p| @positions   = p }
  listen_for(:list_transitions_for_success)  { |t| @transitions = t }
  listen_for(:update_position_success)       { |p| redirect_to positions_path }
  listen_for(:create_position_success)       { |p| redirect_to positions_path }
  listen_for(:create_to_transitions_success) { |t| }

  def index
    @get_positions.all
  end

  def create
    @create_position.create position_params
  end

  def edit
    @get_position.get params[:id]
    @get_positions.all
    @list_transitions_for.list @position
    binding.pry
  end

  def update
    @get_position.get params[:id]
    @update_position.update @position, position_params
    @create_to_transitions.create @position, transitions_params
  end

private

  def get_new_position
    @position = Position.new
  end

  def init_use_cases
    @list_transitions_for  = UseCase::ListTransitionsFor.new(self, transition_repo)
    @create_position       = UseCase::CreatePosition.new(self, position_repo)
    @get_positions         = UseCase::GetPositions.new(self, position_repo)
    @get_position          = UseCase::GetPosition.new(self, position_repo)
    @update_position       = UseCase::UpdatePosition.new(self, position_repo)
    @create_to_transitions = UseCase::CreateToTransitions.new(self, transition_repo)
  end

  def position_params
    params.require(:position).permit(:name, :to_transitions => [])
  end

  def transitions_params
    params.require(:transitions)
  end

  def position_repo
    Repository::Database::Position
  end

  def transition_repo
    Repository::Database::Transition
  end
end
