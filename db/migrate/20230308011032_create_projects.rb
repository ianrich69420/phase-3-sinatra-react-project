class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.text :project_name
      t.text :project_description
      t.text :project_link
      t.timestamps
    end
  end
end
