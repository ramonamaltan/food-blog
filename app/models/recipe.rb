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

  scope :filter_by_name, lambda { |keyword| where('lower(name) LIKE ?', "#{keyword.downcase}") }
  scope :sort_by_most_recent, lambda { order(created_at: :desc) }
  scope :sort_by_alphabet, lambda { order(:name) }
  # scope :sort_by_ingredient
  # scope :sort_by_category
end
