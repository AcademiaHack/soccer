class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :nationality
      t.string :owner
      t.integer :games_played
      t.integer :wins
      t.integer :ties
      t.integer :loses
      t.timestamps null: false
    end
  end
end
