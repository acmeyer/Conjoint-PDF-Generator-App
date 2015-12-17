class ConjointExperimentsController < ApplicationController
  before_action :set_conjoint_experiment, only: [:show, :edit, :update, :destroy]

  # GET /conjoint_experiments
  def index
    @conjoint_experiments = ConjointExperiment.all
  end

  # GET /conjoint_experiments/1
  def show
  end

  # GET /conjoint_experiments/new
  def new
    @conjoint_experiment = ConjointExperiment.new

    @conjoint_attribute = @conjoint_experiment.conjoint_attributes.build
    @conjoint_attribute_value = @conjoint_attribute.conjoint_attribute_values.build
  end

  # GET /conjoint_experiments/1/edit
  def edit
  end

  # POST /conjoint_experiments
  def create
    @conjoint_experiment = ConjointExperiment.new(conjoint_experiment_params)

    if @conjoint_experiment.save
      redirect_to @conjoint_experiment, notice: 'Conjoint experiment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /conjoint_experiments/1
  def update
    if @conjoint_experiment.update(conjoint_experiment_params)
      redirect_to @conjoint_experiment, notice: 'Conjoint experiment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /conjoint_experiments/1
  def destroy
    @conjoint_experiment.destroy
    redirect_to conjoint_experiments_url, notice: 'Conjoint experiment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conjoint_experiment
      @conjoint_experiment = ConjointExperiment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def conjoint_experiment_params
      params.require(:conjoint_experiment).permit!
    end
end
