class BlueprintValue < ApplicationRecord

  belongs_to :property
  accepts_nested_attributes_for :property, reject_if: :all_blank#, allow_destroy: true

  belongs_to :blueprint
=begin
  self.table_name = 'blueprint_values_view'
=end
  validates :value , presence: true
end
