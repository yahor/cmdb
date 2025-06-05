FactoryBot.define do
  factory :configuration_item, class: Application do
    sequence(:name) { |n| "name - #{n}" }
    status { "Active" }
    environment { "Staging" }

    factory :server_configuration_item, class: Server do
      sequence(:name) { |n| "name - #{n}" }
      status { "Active" }
      environment { "Staging" }
    end
  end
end
