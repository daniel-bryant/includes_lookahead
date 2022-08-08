class CreateFilms < ActiveRecord::Migration[7.0]
  def change
    create_table :films do |t|
      t.belongs_to :studio, null: false, foreign_key: true
      t.string :name, null: false
      t.date :release_date, null: false

      t.timestamps
    end
  end
end
