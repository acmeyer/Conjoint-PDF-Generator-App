FactoryGirl.define do  factory :conjoint_attribute_value do
    value "MyString"
  end
  factory :conjoint_attribute do
    name "MyString"
  end
  factory :attribute_value do
    value "MyString"
  end
  factory :attribute do
    name "MyString"
  end
  factory :conjoint_experiment do
    name_of_choice_1 "MyString"
name_of_choice_2 "MyString"
number_of_rounds "MyString"
  end

end
