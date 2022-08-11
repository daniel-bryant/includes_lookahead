class CreateAppearances < ActiveRecord::Migration[7.0]
  def change
    create_table :appearances do |t|
      t.belongs_to :film, null: false, foreign_key: true
      t.belongs_to :role, null: false, foreign_key: true
      t.belongs_to :actor, null: false, foreign_key: true
      t.integer :position, null: false

      t.timestamps
    end
  end
end
