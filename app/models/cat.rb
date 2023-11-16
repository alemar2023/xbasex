class Cat < ApplicationRecord
  belongs_to :parent, class_name: 'Cat', optional: true
  has_many :children, class_name: 'Cat', foreign_key: 'parent_id', dependent: :destroy

  validates :name, presence: true

  scope :root_cats, -> { where(parent_id: nil) }
end
