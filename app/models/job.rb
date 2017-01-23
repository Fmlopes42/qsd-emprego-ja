class Job < ApplicationRecord
  validates :title, :category, :company, :description, :location, presence: true
  belongs_to :company
end
