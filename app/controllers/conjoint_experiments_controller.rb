require 'csv'

class ConjointExperimentsController < ApplicationController
  before_action :set_conjoint_experiment, only: [:show, :edit, :update, :trial_data, :destroy]

  # GET /conjoint_experiments
  def index
    @conjoint_experiments = ConjointExperiment.all
  end

  # GET /conjoint_experiments/1
  def show
    @trial = Trial.create(conjoint_experiment_id: @conjoint_experiment.id)

    attributes_count = @conjoint_experiment.conjoint_attributes.count
    attributes_order = (0...attributes_count).to_a.shuffle!
    @trial_rounds = {}
    @conjoint_experiment.number_of_rounds.to_i.times do |n|
      @trial_rounds["#{n + 1}"] = {}
      @trial_rounds["#{n + 1}"]["#{@conjoint_experiment.name_of_choice_1}"] = attributes_hash(attributes_order)
      @trial_rounds["#{n + 1}"]["#{@conjoint_experiment.name_of_choice_2}"] = attributes_hash(attributes_order)
    end
    @trial.update(data: @trial_rounds.to_json)
  end

  def trial_data
    @trials = @conjoint_experiment.trials

    respond_to do |format|
      format.html
      format.csv { send_data @trials.to_csv }
    end
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
    def attributes_hash(attributes_order)
      attributes_order.each_with_index.map{ |x, i|
        random_choice = (0...@conjoint_experiment.conjoint_attributes[attributes_order[i]].conjoint_attribute_values.count).to_a.shuffle!.first
        { "#{@conjoint_experiment.conjoint_attributes[attributes_order[i]].name}":
          { "text": @conjoint_experiment.conjoint_attributes[attributes_order[i]].conjoint_attribute_values[random_choice].level, "image": @conjoint_experiment.conjoint_attributes[attributes_order[i]].conjoint_attribute_values[random_choice].try(:image).try(:url) }
        }
      }
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_conjoint_experiment
      @conjoint_experiment = ConjointExperiment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def conjoint_experiment_params
      params.require(:conjoint_experiment).permit!
    end
end
