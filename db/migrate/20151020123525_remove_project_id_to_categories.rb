class RemoveProjectIdToCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :project_id, :string
  end
end
