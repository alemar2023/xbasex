class Division < ApplicationRecord


  has_many :children, class_name: 'Division', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Division', optional: true
  has_many :voices


  accepts_nested_attributes_for :voices

  has_one :eng_translation, -> { where(locale: "en")} , class_name: "Voice"

end
