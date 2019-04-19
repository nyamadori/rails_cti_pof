class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.references :issue, foreign_key: true, null: false
      t.integer :severity
      t.string :version_affected

      t.timestamps
    end
  end
end
