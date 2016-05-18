class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.date :datetime
      t.integer :status
      t.integer :local_team_id, null: false
      t.integer :invited_team_id, null: false
      t.references :stadium, foreign_key: true
      t.timestamps null: false
    end
    add_foreign_key(:matches, :teams, column: :local_team_id)
    add_foreign_key(:matches, :teams, column: :invited_team_id)
  end
end
