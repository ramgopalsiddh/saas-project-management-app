class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.belongs_to :account, null: false, foreign_key: true
      t.string :name
      t.string :details
      t.date :expected_completion_date

      t.timestamps
    end
  end
end
