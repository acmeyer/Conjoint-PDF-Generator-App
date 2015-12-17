class ConjointAttribute < ActiveRecord::Base
  belongs_to :conjoint_experiment

  has_many :conjoint_attribute_values
  accepts_nested_attributes_for :conjoint_attribute_values, reject_if: :all_blank, allow_destroy: true
end
