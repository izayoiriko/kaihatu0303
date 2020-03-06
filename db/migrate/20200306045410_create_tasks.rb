class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :worked_name
      t.string :details
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
