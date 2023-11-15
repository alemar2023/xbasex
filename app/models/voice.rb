class Voice < ApplicationRecord
  belongs_to :division

  validates :name, presence: true
  validates :locale, presence: true
end
