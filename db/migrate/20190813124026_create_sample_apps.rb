class CreateSampleApps < ActiveRecord::Migration[5.1]
  def change
    create_table :sample_apps do |t|
      t.string :name
      t.string :note
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
