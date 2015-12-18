class ConjointExperiment < ActiveRecord::Base
  has_many :conjoint_attributes
  accepts_nested_attributes_for :conjoint_attributes, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :name, :name_of_choice_1, :name_of_choice_2, :number_of_rounds
  validates_uniqueness_of :name
end
