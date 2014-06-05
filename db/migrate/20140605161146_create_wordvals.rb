class CreateWordvals < ActiveRecord::Migration
  def change
    create_table :wordvals do |t|
      t.string  :content
      t.integer :score
      t.timestamps
    end
  end
end
