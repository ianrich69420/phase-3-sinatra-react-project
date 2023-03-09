class AddStatusToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :status, :text
  end
end
