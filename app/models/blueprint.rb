class Blueprint < ApplicationRecord
  belongs_to :category
  belongs_to :expansion , optional: true
  belongs_to :brand , optional: true
  has_many :blueprint_values
  has_many :blueprint_details
  has_many :blueprint_translations

  #accepts_nested_attributes_for :blueprint_translations
  accepts_nested_attributes_for :blueprint_translations, :blueprint_values

  #has_many :properties, through: :blueprint_values
  has_one :en_translation, -> { where(locale: "en")} , class_name: "BlueprintTranslation"
  validate :valid_brand?
  has_many :property, through: :blueprint_values
  has_one :rarity, -> { joins(:property).where(properties: { name: 'rarity' }) }, class_name: 'BlueprintValue'

  def valid_brand?
    #se espansionje preseente anche il brand deve sesere presente
    if self.expansion_id.present? && self.brand_id.blank?
      errors.add(:brand_id, "se espansione presente anche il brand deve essere presente")
    end
    #se esp e brand ok allora il brand del blueprint deve essere lo stesso brand dell'espansione alla quale appartiene
    if self.expansion_id.present? && self.brand_id.present? && self.brand_id != self.expansion.brand_id
      errors.add(:brand_id, "se esp e brand ok allora il brand del blueprint deve essere lo stesso brand dell'espansione alla quale appartiene")
    end

  end



end
