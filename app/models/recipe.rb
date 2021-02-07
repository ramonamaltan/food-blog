class Recipe < ApplicationRecord
  belongs_to :user
  has_many :categories, dependent: :destroy
  has_many :doses, dependent: :destroy
  has_many :ingredient, through: :doses

  validates :name, uniqueness: true
  validates :name, presence: true

  has_one_attached :photo
end
