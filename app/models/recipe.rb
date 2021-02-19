class Recipe < ApplicationRecord
  include PgSearch::Model

  belongs_to :user
  has_many :favorite_recipes
  has_many :categories, dependent: :destroy
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  has_one_attached :photo
  has_rich_text :description

  validates :name, uniqueness: true
  validates :name, :photo, presence: true

  accepts_nested_attributes_for :categories

  pg_search_scope :search_by_name,
    against: [ :name ],
    associated_against: {
      categories: [:name],
      ingredients: [:name]
    },
    using: {
      tsearch: { prefix: true, any_word: true }
    }

  scope :sort_by_most_recent, lambda { order(:created_at) }
  scope :sort_by_alphabet, lambda { order(:name) }
  # scope :sort_by_ingredient
end
