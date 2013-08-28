# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact_message do
    nom "MyText"
    email "MyText"
    telephone "MyText"
    message "MyText"
  end
end
