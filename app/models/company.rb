class Company < ApplicationRecord
  validates :name, uniqueness: { case_sensitive: false }
  has_many :jobs
end
