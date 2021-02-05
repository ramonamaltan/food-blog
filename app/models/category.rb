class Category < ApplicationRecord
  belongs_to :recipe

  validates :name, presence: true
end
