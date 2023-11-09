class Expansion < ApplicationRecord
  belongs_to :brand
  has_many :blueprints
  validates :name, presence: true
  validates :name, :uniqueness => {scope: :brand}
end
