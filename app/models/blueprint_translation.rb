class BlueprintTranslation < ApplicationRecord
  belongs_to :blueprint

  validates :name , :locale , presence: true
  validates :locale, :uniqueness => {scope: :blueprint}
end
