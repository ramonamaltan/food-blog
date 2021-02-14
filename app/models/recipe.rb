class Recipe < ApplicationRecord
  belongs_to :user
  has_many :categories, dependent: :destroy
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  has_one_attached :photo
  has_rich_text :description
  
  validates :name, uniqueness: true
  validates :name, :photo, presence: true

  accepts_nested_attributes_for :categories
end
