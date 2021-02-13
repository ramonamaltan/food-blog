class Ingredient < ApplicationRecord
  has_one :dose, dependent: :destroy
  has_many :recipes, through: :doses

  validates :name, presence: true

  accepts_nested_attributes_for :dose
end
