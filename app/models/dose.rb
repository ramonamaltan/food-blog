class Dose < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  accepts_nested_attributes_for :ingredient

  validates :unit, :amount, presence: true
  validates :unit, inclusion: { in: ['grams', 'liters', 'cups'] }
end
