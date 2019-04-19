class CreateFeatureRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :feature_requests do |t|
      t.references :issue, foreign_key: true, null: false
      t.string :sponser

      t.timestamps
    end
  end
end
