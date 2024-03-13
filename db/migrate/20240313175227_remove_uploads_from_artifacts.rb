class RemoveUploadsFromArtifacts < ActiveRecord::Migration[7.1]
  def change
    remove_column :artifacts, :uploads
  end
end
