class BlueprintValue < ApplicationRecord
  belongs_to :blueprint
  belongs_to :property

  validates :value , presence: true
end
