class PositionsController < ApplicationController
  def index
    UseCase::GetPositions.new(listener: self, repository: repository).all
  end

  def create
    UseCase::CreatePosition.new(self, repository).create(position_params)
  end

  def edit
    UseCase::GetPosition.new(self, repository).get(params[:id])
  end

  def new
    @position = Position.new
  end

  def get_position_success(position)
    @position = position
  end

  def create_position_success(position)
    redirect_to positions_path
  end

  def get_positions_success(positions)
    @positions = positions
  end

  def position_params
    params.require(:position).permit(:name)
  end

  def repository
    Repository::Database::Position.new
  end
end
