class CreateMatchups < ActiveRecord::Migration[5.0]
  def change
    create_table :matchups do |t|
      t.string :team1
      t.string :team2
      t.string :line1
      t.string :line2
      t.string :price1
      t.string :price2
      t.integer :consensus
      t.string :betType
      t.string :lineType
      t.string :team1P
      t.string :team2P

      t.timestamps
    end
  end
end
