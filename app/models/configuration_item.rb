class ConfigurationItem < ApplicationRecord
  TYPES = %w[Application Database Server]
  STATUSES = %w[Active Retired Maintenance]
  ENVIRONMENTS = %w[Production Staging Development]

  has_many :relationships, inverse_of: :configuration_item
  accepts_nested_attributes_for :relationships, allow_destroy: true

  validates :name, :type, :status, :environment, presence: true
  validates_inclusion_of :status, in: STATUSES
  validates_inclusion_of :environment, in: ENVIRONMENTS

  before_destroy :check_relationships


  # has_many :used_by_items, through: :relationships
  # has_many :runs_items, through: :relationships

  private

  def check_relationships
    if Relationship.where(connected_item_id: id).exists?
      errors.add(:base, "it is used in other CI relations")

      throw(:abort)
    end
  end
end
