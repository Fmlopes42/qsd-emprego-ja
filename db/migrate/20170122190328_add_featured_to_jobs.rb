class AddFeaturedToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :featured, :boolean
  end
end
