class SequencesController < ApplicationController
  before_filter -> { @use_case = Rhag::UseCase.new(self) }
  before_filter :get_sequence, only: :new

  def index
    @use_case[:list_sequences].list
  end

  def create
    @use_case[:create_sequence].create sequence_params
  end

  def edit
    @use_case[:read_sequence].read(params[:id])
  end

  def update
    @use_case[:update_sequence].update(params[:id], sequence_params)
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
