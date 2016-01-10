class Trial < ActiveRecord::Base
  belongs_to :conjoint_experiment

  before_create :generate_uid

  validates :uid, uniqueness: true, on: :create
  validates :uid, presence: true, uniqueness: true, on: :update

  def self.to_csv
    CSV.generate do |csv|
      header_row = ["UID", "Round", "Choice"]
      # Add attribute names to header row
      #
      # This is ugly, but basically grabs the first choice
      # and only selects the keys, which are the custom attributes
      all.first.data.first.last.first[1].each_with_index do |name, i|
        header_row << "Attribute #{i + 1}"
      end
      csv << header_row

      all.each do |trial|
        # Add all of the data to csv file
        trial.data.each do |round|
          # Add each choice's attribute values
          # Adds uid and round number first
          # Again, ugly but takes each choice's
          # values for an attribute and adds it as a row
          # to the csv file
          # TODO: refractor this!
          choice_1_row = [trial.uid, round.first, trial.conjoint_experiment.name_of_choice_1]
          choice_2_row = [trial.uid, round.first, trial.conjoint_experiment.name_of_choice_2]
          choice_1_row.concat attribute_values_for_row(round, trial.conjoint_experiment.name_of_choice_1)
          choice_2_row.concat attribute_values_for_row(round, trial.conjoint_experiment.name_of_choice_2)
          csv << choice_1_row
          csv << choice_2_row
        end
      end
    end
  end

  def self.attribute_values_for_row(round, name_of_choice)
    attr_value_array = []
    round.last[name_of_choice].each do |attributes|
      attr_value_array << attributes.values.first["text"]
    end
    attr_value_array
  end

  protected
  def generate_uid
    # Ensure uid is unique
    begin
      random_uid = SecureRandom.hex(5).upcase
    end while Trial.find_by_uid(random_uid)

    self.uid = random_uid
  end
end
