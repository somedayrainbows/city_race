class CreateClues < ActiveRecord::Migration[5.0]
  def change
    create_table :clues do |t|
      t.string :title
      t.string :description
      t.integer :order
      t.string :task_type
      t.references :hunt, foreign_key: true

      t.timestamps
    end
  end
end
