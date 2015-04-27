class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.belongs_to :politician, index: true
      t.datetime :start_date
      t.datetime :end_date
      t.string :city
      t.string :state
      t.decimal :expenses, :precision => 8, :scale => 2
      t.text :details
      t.timestamps null: false
    end
  end
end
