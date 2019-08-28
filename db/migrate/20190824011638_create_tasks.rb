class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.integer :task_id
      t.string :name
      t.integer :user_id
      t.integer :task_id
      t.datetime :creatred_at
      t.datetime :started_at
      t.datetime :finished_at

      t.timestamps
    end
  end
end
