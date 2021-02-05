class Dose < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  validates :unit, :amount, presence: true
  validates :unit, inclusion: { in: ['grams', 'liters', 'cups'] }
end
