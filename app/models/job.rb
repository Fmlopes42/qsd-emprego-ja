class Job < ApplicationRecord
  validates :title, :category, :company_id, :description, :location, presence: true
  belongs_to :company
  belongs_to :category
end
