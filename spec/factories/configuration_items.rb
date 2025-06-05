FactoryBot.define do
  factory :configuration_item do
    sequence(:name) { |n| "name - #{n}" }
    type { "Application" }
    status { "Active" }
    environment { "Staging" }
  end
end
