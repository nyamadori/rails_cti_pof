class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.references :user, foreign_key: true, null: false
      t.references :product, foreign_key: true, null: false
      t.integer :status, null: false, default: 0
      t.string :title, null: false
      t.text :description
      t.integer :priority
      t.string :version_resolved

      t.timestamps
    end
  end
end
