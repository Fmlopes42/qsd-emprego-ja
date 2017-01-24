class AddCategoryRefToJobs < ActiveRecord::Migration[5.0]
  def change
    add_reference :jobs, :category, foreign_key: true
  end
end
