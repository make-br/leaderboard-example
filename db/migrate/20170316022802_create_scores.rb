class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.integer :points
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
