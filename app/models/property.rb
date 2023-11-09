class Property < ApplicationRecord
  has_many :blueprint_values
  has_many :blueprints, through: :blueprint_values

  validates :name , presence: true, uniqueness: true
end
