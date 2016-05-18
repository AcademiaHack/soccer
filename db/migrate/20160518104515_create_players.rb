class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :strong_leg
      t.integer :status
      t.references :team, foreign_key: true
      t.timestamps null: false
    end
  end
end
