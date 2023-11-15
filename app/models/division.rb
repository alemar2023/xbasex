class Division < ApplicationRecord
  belongs_to :parent, class_name: 'Division', optional: true
  has_many :children, class_name: 'Division', foreign_key: 'parent_id', dependent: :destroy
end
