class SequencesController < ApplicationController
  before_filter -> { @domain_driver = DomainDriven::Driver.new(self) }
  before_filter :get_sequence, only: :new

  def index
    @domain_driver[:list_sequences].list
  end

  def create
    @domain_driver[:create_sequence].create sequence_params
  end

  def edit
    @domain_driver[:read_sequence].read(params[:id])
  end

  def update
    @domain_driver[:update_sequence].update(params[:id], sequence_params)
  end

  private

  listen_for(:list_sequences_success)  { |sequences| @sequences = sequences }
  listen_for(:create_sequence_success) { |sequence| redirect_to sequences_path }
  listen_for(:read_sequence_success)   { |sequence| @sequence = sequence }
  listen_for(:update_sequence_success) { |sequence| redirect_to sequences_path }

  def get_sequence
    @sequence = ::Sequence.new
  end

  def sequence_params
    params.require(:sequence).permit(:name)
  end
end
