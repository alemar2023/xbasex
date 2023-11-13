class BlueprintValue < ApplicationRecord

  belongs_to :property

  belongs_to :blueprint
=begin
  self.table_name = 'blueprint_values_view'
=end
  validates :value , presence: true
end
