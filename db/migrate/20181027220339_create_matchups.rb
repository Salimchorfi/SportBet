class CreateMatchups < ActiveRecord::Migration[5.0]
  def change
    create_table :matchups do |t|
      t.string :team1
      t.string :team2
      t.string :line1
      t.string :line2
      t.string :price1
      t.string :price2
      t.string :consensus

      t.timestamps
    end
  end
end
