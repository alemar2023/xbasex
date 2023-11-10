include LocalesHelper
class BlueprintTranslation < ApplicationRecord


  enum locale: all_locales.index_by(&:itself), _prefix: :locale
  belongs_to :blueprint

  validates :name , :locale , presence: true
  validates :locale, :uniqueness => {scope: :blueprint}

end
