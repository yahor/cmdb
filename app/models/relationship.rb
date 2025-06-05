class Relationship < ApplicationRecord
  USING_TYPES = %w[runs uses]

  belongs_to :configuration_item
  belongs_to :connected_item, class_name: "ConfigurationItem"

  validates :using_type, presence: :true
  validates_inclusion_of :using_type, in: USING_TYPES

  # TODO improve possible circular dependencies when creating relationships.
  validate do
    if connected_item_id == configuration_item_id
      errors.add :base, message: "circular dependencies not allowed when creating relationships."
    end
  end
end
