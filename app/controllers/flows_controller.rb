class FlowsController < ApplicationController

  def new
    @flow     = Flow.new
    @position = Position.new
  end

  def create
    UseCase::CreateFlowPosition.new(listener: self, repository: repository::Flow.new)
      .create(flow: Flow.new(flow_params), position: Position.new(position_params))
  end

  def show
    UseCase::FindFlow.new(
      listener:   self,
      repository: repository::Flow.new
    ).find(id: params[:id])
  end

  def index
    UseCase::GetFlows.new(self, repository::Flow.new).get
  end

  ### UseCaseEvents

  def get_flows_success(flows)
    @flows = flows
  end

  def create_flow_success(flow)
    redirect_to flows_path
  end

  def find_flow_success(flow:, positions:)
    @flow = flow
    @positions = positions
  end

  def flow_params
    params.require(:flow).permit(:name)
  end

  def position_params
    params.require(:position).permit(:name)
  end
end
