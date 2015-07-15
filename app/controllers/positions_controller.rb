class PositionsController < ApplicationController
  def index
    UseCase::GetPositions.new(self, repository).get
  end

  def new
    @position = Position.new
  end

  def create
    UseCase::CreatePosition.new(self, repository).create(position_params)
  end

  def show
    UseCase::GetPosition.new(self, repository).get(params[:id])
    UseCase::GetPositions.new(self, repository).get
  end

  def get_positions_success(positions)
    @positions = positions
  end

  def create_position_success(position)
    redirect_to position_path(position.id)
  end

  def get_position_success(position)
    @position = position
  end

  private

  def position_params
    params.require(:position).permit(:name)
  end

  def repository
    Repository::Database::Position.new
  end


end
